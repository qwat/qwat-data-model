#!/usr/bin/env python

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_pipe

from: qwat_od.pipe

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

joins:
  district:
    table: qwat_od.district
    fkey: fk_district
  pressurezone:
    table: qwat_od.pressurezone
    fkey: fk_pressurezone
  precision:
    table: qwat_vl.precision
    fkey: fk_precision
  distributor:
    table: qwat_od.distributor
    fkey: fk_distributor
  status:
    table: qwat_vl.status
    fkey: fk_status
  folder:
    table: qwat_od.folder
    fkey: fk_folder
  pipe_function:
    table: qwat_vl.pipe_function
    fkey: fk_function
  installmethod:
    table: qwat_vl.pipe_installmethod
    fkey: fk_installmethod
  material:
    table: qwat_vl.pipe_material
    fkey: fk_material
  protection:
    table: qwat_vl.pipe_protection
    fkey: fk_protection
  node_a:
    table: qwat_od.node
    fkey: fk_node_a
  node_b:
    table: qwat_od.node
    fkey: fk_node_b


""")

print SqlExportView(pg_service, definition).sql()
