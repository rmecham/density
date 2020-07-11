from django.contrib import admin

from .models import Space, Doorway, DPU, DPUEvent, SpaceOccupancy


@admin.register(Space)
class SpaceAdmin(admin.ModelAdmin):
    """Space admin."""


@admin.register(Doorway)
class DoorwayAdmin(admin.ModelAdmin):
    """Doorway admin."""


@admin.register(DPU)
class DPUAdmin(admin.ModelAdmin):
    """DPU admin."""


@admin.register(DPUEvent)
class DPUEventAdmin(admin.ModelAdmin):
    """DPUEvent admin."""

    list_display = ["pk", "dpu", "timestamp", "direction"]


@admin.register(SpaceOccupancy)
class SpaceOccupancyAdmin(admin.ModelAdmin):
    """SpaceOccupancy admin."""

    list_display = ["pk", "space", "dpu_event", "status", "occupancy"]
    list_filter = ["space"]
