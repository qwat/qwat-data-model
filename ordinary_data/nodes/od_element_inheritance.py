#!/usr/bin/env python

import imp
import os
import sys


pgiv = imp.load_source('PGInheritanceView', os.path.join(os.path.dirname(__file__), '../../metaproject/postgresql/pg_inheritance_view/pg_inheritance_view.py'))

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
  
    valve:
      table: qwat_od.valve
      pkey: id
      
    hydrant:
      table: qwat_od.hydrant
      pkey: id
      
    part:
      table: qwat_od.part
      pkey: id
      
    meter:
      table: qwat_od.meter
      pkey: id
      
    subscriber:
      table: qwat_od.subscriber
      pkey: id
      
    cover:
      table: qwat_od.cover
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
      valve: networkseparation
      installation: networkseparation
    fk_pipe:
      meter: fk_pipe
      part: fk_pipe
      subscriber: fk_pipe
      valve: fk_pipe
"""
  
print pgiv.PGInheritanceView('qwat_test', qwat_elements).sql_all()



#  merge_columns:
#    - alias: parcel
#      columns:
#        - meter: parcel
#        - subscriber: parcel
#        - installation: parcel
# 
#    - alias: networkseparation
#      columns:
#        - valve: networkseparation
#        - installation: networkseparation
# 
#    - alias: fk_pipe
#      columns:
#        - meter: fk_pipe
#        - part: fk_pipe
#        - subscriber: fk_pipe
#        - valve: fk_pipe




