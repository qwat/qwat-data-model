#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import yaml
import sys
from sql_export_view import SqlExportView


if len(sys.argv) >=2:
    SRID = sys.argv[1]
else:
    SRID = 21781
if len(sys.argv) >= 3:
    pg_service = sys.argv[2]
else:
    pg_service = "pg_qwat_test"

definition = yaml.safe_load("""

name: qwat_od.vw_export_pipe

from: qwat_od.pipe

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

extra_fields:
  geometry2d: 'ST_Force2D(pipe.geometry)::geometry(LINESTRING,{})'
  schema_visible: 'COALESCE(schema_force_visible, pipe_function.schema_visible)'

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
  pipe_material:
    table: qwat_vl.pipe_material
    fkey: fk_material
  protection:
    table: qwat_vl.pipe_protection
    fkey: fk_protection
  watertype:
    table: qwat_vl.watertype
    fkey: fk_watertype
  node_a:
    table: qwat_od.node
    fkey: fk_node_a
  node_b:
    table: qwat_od.node
    fkey: fk_node_b


""".format(SRID))
# fix_print_with_import

# fix_print_with_import
print(SqlExportView(pg_service, definition).sql())
