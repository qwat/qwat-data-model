#!/usr/bin/env python

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_valve

from: qwat_od.valve

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
    
  valve_type:
    table: qwat_vl.valve_type
    fkey: fk_valve_type
  valve_function:
    table: qwat_vl.valve_function
    fkey: fk_valve_function
  valve_actuation:
    table: qwat_vl.valve_actuation
    fkey: fk_valve_actuation
   

""")

print SqlExportView(pg_service, definition).sql()
