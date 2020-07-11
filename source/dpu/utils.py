"""Utilities for DPUs."""
import datetime

from django.conf import settings

from .models import DPU, DPUEvent, SpaceOccupancy


def record_dpu_event(dpu_id, timestamp, direction):
    """
    This function is the main interface for handling new DPU events. It handles both the
    creation of the DPUEvent record AND the requisite SpaceOccupancy record.
    """
    # First, go ahead and create the DPUEvent.
    dpu = DPU.objects.select_related("entry_space", "exit_space").get(dpu_id=dpu_id)
    dpu_event = DPUEvent.objects.create(
        dpu=dpu, timestamp=timestamp, direction=direction
    )
    if dpu.entry_space:
        SpaceOccupancy.objects.create(space=dpu.entry_space, dpu_event=dpu_event)
    if dpu.exit_space:
        SpaceOccupancy.objects.create(space=dpu.exit_space, dpu_event=dpu_event)
    # Next, update any SpaceOccupancy records more than THRESHOLD seconds older than the
    # current record to be SETTLED.
    # If this were a real project, I would make this a periodic process and do the
    # comparison to now, rather than the current timestamp.
    SpaceOccupancy.objects.filter(
        status=SpaceOccupancy.RecordStatus.PENDING,
        dpu_event__timestamp__lt=timestamp
        - datetime.timedelta(seconds=settings.OCCUPANCY_SETTLED_THRESHOLD),
    ).update(status=SpaceOccupancy.RecordStatus.SETTLED)
    # Finally, compute occupancies for all PENDING SpaceOccupancy records.
    if dpu.entry_space:
        calculate_occupancy(space=dpu.entry_space)
    if dpu.exit_space:
        calculate_occupancy(space=dpu.exit_space)


def calculate_occupancy(space):
    """
    Calculate the occupancy for each SpaceOccupancy record for the given space that is
    still PENDING.

    Assumes that SpaceOccupancy records are being marked as SETTLED elsewhere in the code
    as appropriate.
    """
    # Start the the most recent SpaceOccupancy that is SETTLED.
    most_recent_settled = (
        SpaceOccupancy.objects.filter(
            space=space, status=SpaceOccupancy.RecordStatus.SETTLED
        )
        .order_by("-dpu_event__timestamp")
        .first()
    )
    # `occupancy` is our running balance.
    try:
        occupancy = most_recent_settled.occupancy
    except AttributeError:
        # No existing SpaceOccupancy objects so start from 0.
        occupancy = 0
    for space_occupancy in (
        SpaceOccupancy.objects.select_related("dpu_event", "dpu_event__dpu")
        .filter(space=space, status=SpaceOccupancy.RecordStatus.PENDING)
        .order_by("dpu_event__timestamp")
    ):
        # If our space is an “exit” space for the given DPU, we need to inverse the
        # direction.
        direction = space_occupancy.dpu_event.direction
        if space.pk == space_occupancy.dpu_event.dpu.exit_space_id:
            direction = -direction
        occupancy += direction
        space_occupancy.occupancy = occupancy
        space_occupancy.save()
