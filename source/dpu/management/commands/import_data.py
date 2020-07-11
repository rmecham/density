"""
A management command to import the sample DPU data from a CSV file.
"""
from csv import DictReader

from dateutil.parser import isoparse
from django.core.management import BaseCommand
from django.db import transaction
from django.utils.decorators import method_decorator

from dpu.models import DPU, Doorway, Space
from dpu.utils import record_dpu_event


@method_decorator(transaction.atomic, name="handle")
class Command(BaseCommand):
    """Implementation of the sample data import process."""

    help = "Imports the sample DPU data."

    def add_arguments(self, parser):
        parser.add_argument("file", help="file with the sample DPU data in CSV format")

    def handle(self, *args, **options):
        """Handler for the command."""
        # Perform initial database setup, if base objects are not already added.
        space_a, _ = Space.objects.get_or_create(name="A")
        space_b, _ = Space.objects.get_or_create(name="B")
        doorway_x, _ = Doorway.objects.get_or_create(name="X")
        doorway_z, _ = Doorway.objects.get_or_create(name="Z")
        DPU.objects.get_or_create(dpu_id=283, doorway=doorway_x, entry_space=space_a)
        DPU.objects.get_or_create(
            dpu_id=423, doorway=doorway_z, entry_space=space_a, exit_space=space_b
        )
        with open(options["file"], "r") as source:
            self.process_file(source)

    def process_file(self, source):
        """Actually read the data from the file and import it."""
        reader = DictReader(source)
        for row in reader:
            record_dpu_event(
                dpu_id=int(row["dpu_id"]),
                timestamp=isoparse(row["timestamp"]),
                direction=int(row["direction"]),
            )
