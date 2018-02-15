#!/usr/bin/env python3

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
    pg_service = sys.argv[1]
else:
    pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_remote

from: qwat_od.remote

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

joins:
  distributor:
    table: qwat_od.distributor
    fkey: fk_distributor
  status:
    table: qwat_vl.status
    fkey: fk_status
  distributor:
    table: qwat_od.distributor
    fkey: fk_distributor
  precision:
    table: qwat_vl.precision
    fkey: fk_precision
  material:
    table: qwat_vl.pipe_material
    fkey: fk_material



""")
# fix_print_with_import

# fix_print_with_import
print(SqlExportView(pg_service, definition).sql())
