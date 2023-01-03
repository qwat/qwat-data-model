#!/usr/bin/env python3

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
    pg_service = sys.argv[1]
else:
    pg_service = "qwat_test"

definition = yaml.safe_load("""

name: qwat_od.vw_export_meter

from: qwat_od.vw_element_meter

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

joins:
  district:
    table: qwat_od.district
    fkey: fk_district
  precision:
    table: qwat_vl.precision
    fkey: fk_precision
  precisionalti:
    table: qwat_vl.precisionalti
    fkey: fk_precisionalti
  object_reference:
    table: qwat_vl.object_reference
    fkey: fk_object_reference
  status:
    table: qwat_vl.status
    fkey: fk_status
  folder:
    table: qwat_od.folder
    fkey: fk_folder
   

""")
# fix_print_with_import

# fix_print_with_import
print(SqlExportView(pg_service, definition).sql())
