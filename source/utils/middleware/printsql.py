"""Middleware that prints SQL queries to console."""
import re
from decimal import Decimal

import sqlparse
from django.db import connection

_sql_fields_re = re.compile(r"SELECT .*? FROM")
_sql_aggregates_re = re.compile(r"SELECT .*?(COUNT|SUM|AVERAGE|MIN|MAX).*? FROM")


def truncate_sql(sql, aggregates=True):
    """Pare down the output somewhat."""
    if not aggregates and _sql_aggregates_re.match(sql):
        return sql
    return _sql_fields_re.sub("SELECT … FROM", sql)


def printsql_middleware(get_response):
    """Print the SQL queries being run to the console. DEVELOPMENT ONLY!"""

    def middleware(request):
        response = get_response(request)
        num_queries = 0
        time = Decimal("0.0000")
        for query in connection.queries:
            num_queries += 1
            time += Decimal(query["time"])
            sql = truncate_sql(query["sql"], aggregates=False)
            formatted_sql = sqlparse.format(sql, reindent=True)
            for index, line in enumerate(formatted_sql.split("\n")):
                if index == 0:
                    print("[SQL] {}".format(line))
                else:
                    print("      {}".format(line))
        deduped = set([q["sql"] for q in connection.queries])
        print(
            "[SQL] {} queries, {} duplicates. {} seconds.".format(
                num_queries, num_queries - len(deduped), time
            )
        )
        return response

    return middleware
