#!/usr/bin/env python

import imp
import os
import sys

pgiv = imp.load_source('PGInheritanceView', os.path.join(os.path.dirname(__file__), '../../metaproject/postgresql/pg_inheritance_view/pg_inheritance_view.py'))

if len(sys.argv) > 1:
	pg_service = sys.argv[1]
else:
	pg_service = 'qwat_test'


qwat_node_element = """
table: qwat_od.node
alias: node
pkey: id
pkey_value: qwat_od.fn_node_create(NEW.geometry)
pkey_value_create_entry: true
schema: qwat_od

custom_delete: "PERFORM qwat_od.fn_node_set_type(OLD.id)"

trigger_pre: >
  \t\t-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
  \t\tIF NEW.altitude IS NULL THEN
  \t\t	NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
  \t\tEND IF;
  \t\t-- TODO handle going to NULL on update 
  \t\tIF 	NEW.altitude IS NOT NULL AND ST_Z(NEW.geometry) <> NEW.altitude THEN
  \t\t	NEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
  \t\tEND IF;

alter:
  geometry:
    read: ST_Force2D
    write: ST_Force3D
  geometry_alt1:
    read: ST_Force2D
    write: ST_Force3D
  geometry_alt2:
    read: ST_Force2D
    write: ST_Force3D

children:
  element:
    table: qwat_od.network_element
    pkey: id

merge_view:
  name: vw_qwat_node
  allow_type_change: false
  allow_parent_only: true
"""

print pgiv.PGInheritanceView(pg_service, qwat_node_element).sql_all()


# print pgiv.PGInheritanceView(pg_service, qwat_node_element).sql_join_insert_trigger("element")
# print pgiv.PGInheritanceView(pg_service, qwat_node_element).sql_merge_insert_trigger()
# 
# print pgiv.PGInheritanceView(pg_service, qwat_node_element).sql_join_update_trigger("element")
# print pgiv.PGInheritanceView(pg_service, qwat_node_element).sql_merge_update_trigger()


