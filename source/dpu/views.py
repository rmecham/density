"""DPU API"""
import datetime

from django.http import Http404, JsonResponse
from django.views.generic import View

from .models import SpaceOccupancy


class OccupancyView(View):
    """A view to query the occupancy of a space at a given point in time."""

    def get(self, request, **kwargs):
        """
        Return the occupancy of the indicated space.

        If a timestamp is provided, return the occupancy as of that timestamp. Otherwise,
        return the most recent occupancy record.
        """
        query = SpaceOccupancy.objects.select_related("space", "dpu_event").filter(
            space__name=kwargs["name"]
        )
        if "timestamp" in kwargs:
            try:
                requested_timestamp = datetime.datetime.strptime(
                    kwargs["timestamp"], "%Y-%m-%dT%H-%M-%S"
                )
            except ValueError:
                raise Http404("Unknown timestamp format.")
            else:
                query = query.filter(dpu_event__timestamp__lte=requested_timestamp)
        space_occupancy = query.order_by("-dpu_event__timestamp").first()
        if not space_occupancy:
            raise Http404("No records for the requested space.")
        return JsonResponse(
            {
                "space": {
                    "id": space_occupancy.space.pk,
                    "name": space_occupancy.space.name,
                },
                "timestamp": space_occupancy.dpu_event.timestamp.isoformat(),
                "occupancy": space_occupancy.occupancy,
            }
        )
