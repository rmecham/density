"""Models for handling DPU data."""
from django.db import models
from utils.db.models import AbstractBaseModel


class Space(AbstractBaseModel):
    """A representation of a space whose occupancy we are monitoring."""

    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


class Doorway(AbstractBaseModel):
    """A representation of doorways into or out of a space, where a DPU may be located."""

    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name


class DPU(AbstractBaseModel):
    """DPUs that we are monitoring."""

    dpu_id = models.PositiveIntegerField(unique=True)
    doorway = models.OneToOneField(
        Doorway, on_delete=models.PROTECT, blank=True, null=True
    )
    entry_space = models.ForeignKey(
        Space,
        on_delete=models.PROTECT,
        related_name="entry_dpus",
        blank=True,
        null=True,
        help_text=(
            "An entry (+1) on this DPU represents an entry into this space. "
            "Leave blank for an untracked space."
        ),
    )
    exit_space = models.ForeignKey(
        Space,
        on_delete=models.PROTECT,
        related_name="exit_dpus",
        blank=True,
        null=True,
        help_text=(
            "An exit (-1) on this DPU represents an exit from this space. "
            "Leave blank for an untracked space."
        ),
    )

    def __str__(self):
        return f"{self.dpu_id}"


class DPUEvent(AbstractBaseModel):
    """A record of a DPU observing an entry or an exit."""

    dpu = models.ForeignKey(DPU, on_delete=models.PROTECT)
    timestamp = models.DateTimeField(db_index=True)
    direction = models.SmallIntegerField(
        help_text="1 designates an entry; -1 designates an exit."
    )

    class Meta:
        ordering = ["-timestamp"]

    def __str__(self):
        return f"{self.dpu} {self.timestamp} {self.direction}"


class SpaceOccupancy(AbstractBaseModel):
    """The occupancy of a given space as of a given time."""

    class RecordStatus(models.TextChoices):
        """
        The status of this occupancy record.

        PENDING: The occupancy field on this record shouldn’t be relied upon completely;
                 events from the DPU may still arrive which pre-date this record.
        SETTLED: The occupancy field on this record should be stable; we’ve let enough
                 time pass that we aren’t worried about any more out-of-sequence events.
        """

        PENDING = "PENDING", "Pending"
        SETTLED = "SETTLED", "Settled"

    space = models.ForeignKey(Space, on_delete=models.PROTECT)
    dpu_event = models.ForeignKey(DPUEvent, on_delete=models.PROTECT)
    status = models.CharField(
        max_length=30, choices=RecordStatus.choices, default=RecordStatus.PENDING
    )
    occupancy = models.IntegerField(
        default=0,
        help_text="The total occupancy of this space as of this record’s timestamp.",
    )

    class Meta:
        ordering = ["-dpu_event__timestamp"]
