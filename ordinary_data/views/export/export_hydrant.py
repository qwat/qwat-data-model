#!/usr/bin/env python

import yaml
import sys
from sql_export_view import SqlExportView

if len(sys.argv) > 1:
  pg_service = sys.argv[1]
else:
  pg_service = "qwat_test"

definition = yaml.load("""

name: qwat_od.vw_export_hydrant

from: qwat_od.vw_element_hydrant

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
    
  provider:
    table: qwat_vl.hydrant_provider
    fkey: fk_provider
  material:
    table: qwat_vl.hydrant_material
    fkey: fk_material
  model_sup:
    table: qwat_vl.hydrant_model_sup
    fkey: fk_model_sup
  model_inf:
    table: qwat_vl.hydrant_model_inf
    fkey: fk_model_inf
  output:
    table: qwat_vl.hydrant_output
    fkey: fk_output
   

""")

print SqlExportView(pg_service, definition).sql()
