#!/usr/bin/env python

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_printmap

from: qwat_od.printmap

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

joins:
  district:
    table: qwat_od.district
    fkey: fk_district


""")

print SqlExportView(pg_service, definition).sql()
