"""
Project-wide utilities for models.
"""
import uuid

from django.db import models


class AbstractBaseModel(models.Model):
    """
    The abstract base model that should be used by all models in the project, either
    directly or through inheriting from classes that also inherit from this. Provides 3
    universally-applicable fields:

     1. A UUID-based primary key.
     2. A created date/time.
     3. A modified date/time.
    """

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    created = models.DateTimeField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True
