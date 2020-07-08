"""
Development settings for the Density project.
"""

# pylint: disable=wildcard-import,unused-wildcard-import
from .base import *

DEBUG = True

# Middleware
# Output SQL queries to the console so we can monitor query usage.
MIDDLEWARE.append("utils.middleware.printsql.printsql_middleware")
