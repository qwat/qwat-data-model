#!/usr/bin/env python

import imp
import os
import sys


pgiv = imp.load_source('PGInheritanceView', os.path.join(os.path.dirname(__file__), '../../../metaproject/postgresql/pg_inheritance_view/pg_inheritance_view.py'))

if len(sys.argv) > 1:
    pg_service = sys.argv[1]
else:
    pg_service = "qwat_test"


qwat_elements = """
alias: element
table: qwat_od.vw_node_element
pkey: id
pkey_value: NEW.id
schema: qwat_od

children:
    installation:
      table: qwat_od.vw_qwat_installation
      pkey: id

    hydrant:
      table: qwat_od.hydrant
      pkey: id

    part:
      table: qwat_od.part
      pkey: id
      alter:
        fk_pipe:
          write: qwat_od.fn_pipe_get_id(NEW.geometry)

    meter:
      table: qwat_od.meter
      pkey: id

    subscriber:
      table: qwat_od.subscriber
      pkey: id

    samplingpoint:
      table: qwat_od.samplingpoint
      pkey: id

merge_view:
  name: vw_qwat_network_element
  allow_type_change: false
  allow_parent_only: true
  merge_columns:
    parcel:
      meter: parcel
      subscriber: parcel
      installation: parcel
    networkseparation:
      installation: networkseparation
    fk_pipe:
      meter: fk_pipe
      part: fk_pipe
      subscriber: fk_pipe
"""

print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_all()

# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("installation")
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("hydrant")
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("part")
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("meter")
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("subscriber")
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("cover")
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_join_insert_trigger("samplingpoint")
# 
# print pgiv.PGInheritanceView(pg_service, qwat_elements).sql_merge_insert_trigger()

