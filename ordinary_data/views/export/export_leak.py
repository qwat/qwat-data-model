#!/usr/bin/env python

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_leak

from: qwat_od.leak

joins:
  cause:
    table: qwat_vl.leak_cause
    fkey: fk_cause
  pipe:
    table: qwat_od.vw_export_pipe
    fkey: fk_pipe

""")

print SqlExportView(pg_service, definition).sql()
