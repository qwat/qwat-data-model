#!/usr/bin/env python3

from __future__ import print_function
from __future__ import absolute_import
import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_installation

from: qwat_od.vw_element_installation

exclude_join_fields:
  - geometry%
  - label_1%
  - label_2%

joins:
  district:
    table: qwat_od.district
    fkey: fk_district
  remote:
    table: qwat_vl.remote_type
    fkey: fk_remote
  pressurezone:
    table: qwat_od.pressurezone
    fkey: fk_pressurezone
  precision:
    table: qwat_vl.precision
    fkey: fk_precision
  precisionalti:
    table: qwat_vl.precisionalti
    fkey: fk_precisionalti
  object_reference:
    table: qwat_vl.object_reference
    fkey: fk_object_reference
  distributor:
    table: qwat_od.distributor
    fkey: fk_distributor
  status:
    table: qwat_vl.status
    fkey: fk_status
  folder:
    table: qwat_od.folder
    fkey: fk_folder
  watertype:
    table: qwat_vl.watertype
    fkey: fk_watertype
  source_type:
    table: qwat_vl.source_type
    fkey: fk_source_type
  source_quality:
    table: qwat_vl.source_quality
    fkey: fk_source_quality
  pump_type:
    table: qwat_vl.pump_type
    fkey: fk_pump_type
  pump_operating:
    table: qwat_vl.pump_operating
    fkey: fk_pump_operating
  overflow:
    table: qwat_vl.overflow
    fkey: fk_overflow
  tank_firestorage:
    table: qwat_vl.tank_firestorage
    fkey: fk_tank_firestorage
  cistern1:
    table: qwat_vl.cistern
    fkey: cistern1_fk_type
  cistern2:
    table: qwat_vl.cistern
    fkey: cistern2_fk_type
  pressurecontrol_type:
    table: qwat_vl.pressurecontrol_type
    fkey: fk_pressurecontrol_type
""")
# fix_print_with_import

# fix_print_with_import
print(SqlExportView(pg_service, definition).sql())
