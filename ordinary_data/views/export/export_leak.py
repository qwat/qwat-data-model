#!/usr/bin/env python3

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

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

joins:
  cause:
    table: qwat_vl.leak_cause
    fkey: fk_cause
  pipe:
    table: qwat_od.vw_export_pipe
    fkey: fk_pipe

""")
# fix_print_with_import

# fix_print_with_import
print(SqlExportView(pg_service, definition).sql())
