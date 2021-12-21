#!/usr/bin/env python3

from __future__ import print_function
import imp
import os
import sys

pgiv = imp.load_source(
    'PGInheritanceViewRecursive',
    os.path.join(os.path.dirname(__file__), 'pg_inheritance_view_recursive.py')
)

if len(sys.argv) > 1:
    pg_service = sys.argv[1]
else:
    pg_service = 'qwat_test'


qwat_node_element = """
table: qwat_od.node
alias: node
pkey: id
pkey_value: qwat_od.fn_node_create(NEW.geometry, status => NEW.fk_status, distributors => NEW.fk_distributor)
pkey_value_create_entry: true
schema: qwat_od
generate_child_views: True
exec_order: 2
isroot: True

custom_delete: "PERFORM qwat_od.fn_node_set_type(OLD.id)"

trigger_pre: >
  \t\t-- altitude is prioritary on Z value of the geometry (if both changed, only altitude is taken into account)
  \t\tIF NEW.altitude IS NULL THEN
  \t\t	NEW.altitude := NULLIF( ST_Z(NEW.geometry), 0.0); -- 0 is the NULL value
  \t\tEND IF;
  \t\t-- TODO handle going to NULL on update
  \t\tIF	NEW.altitude IS NULL     AND ST_Z(NEW.geometry) <> 0.0 OR
  \t\t		NEW.altitude IS NOT NULL AND ( ST_Z(NEW.geometry) IS NULL OR ST_Z(NEW.geometry) <> NEW.altitude ) THEN
  \t\t\t\tNEW.geometry := ST_SetSRID( ST_MakePoint( ST_X(NEW.geometry), ST_Y(NEW.geometry), COALESCE(NEW.altitude,0) ), ST_SRID(NEW.geometry) );
  \t\tEND IF;


children:
  element:

    c_table: qwat_od.network_element
    table: qwat_od.vw_node_element
    pkey: id
    c_alter:
      orientation:
        read: COALESCE(element.orientation, -node._pipe_orientation)

    alias: element
    pkey_value: NEW.id
    schema: qwat_od
    generate_child_views: True
    exec_order: 3
    trig_here: True


    children:
        installation:
            c_table: qwat_od.vw_qwat_installation
            table: qwat_od.installation
            pkey: id
            alias: installation
            pkey: id
            pkey_value: NEW.id
            schema: qwat_od
            generate_child_views: False
            exec_order: 1
            trig_here: True

            children:
                chamber:
                    table: qwat_od.chamber
                    c_table: qwat_od.chamber
                    pkey: id
                    generate_view: False

                pressurecontrol:
                    table: qwat_od.pressurecontrol
                    c_table: qwat_od.pressurecontrol
                    pkey: id
                    generate_view: False

                pump:
                    table: qwat_od.pump
                    c_table: qwat_od.pump
                    pkey: id
                    generate_view: False

                source:
                    table: qwat_od.source
                    c_table: qwat_od.source
                    pkey: id
                    generate_view: False

                tank:
                    table: qwat_od.tank
                    c_table: qwat_od.tank
                    pkey: id
                    generate_view: False

                treatment:
                    c_table: qwat_od.treatment
                    table: qwat_od.treatment
                    pkey: id
                    generate_view: False

            merge_view:
                name: vw_qwat_installation
                allow_type_change: true

        hydrant:
            c_table: qwat_od.hydrant
            table: qwat_od.hydrant
            pkey: id
            trig_here: True

        part:
            c_table: qwat_od.part
            table: qwat_od.part
            pkey: id
            c_alter:
                fk_pipe:
                    write: qwat_od.fn_pipe_get_id(NEW.geometry)
            trig_here: True

            custom_update: "PERFORM qwat_od.fn_element_part_set_orientation(NEW.id);"

        meter:
            c_table: qwat_od.meter
            table: qwat_od.meter
            pkey: id
            trig_here: True

        subscriber:
            c_table: qwat_od.subscriber
            table: qwat_od.subscriber
            pkey: id
            trig_here: True

        samplingpoint:
            c_table: qwat_od.samplingpoint
            table: qwat_od.samplingpoint
            pkey: id
            trig_here: True

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

merge_view:
  name: vw_qwat_node
  allow_type_change: false
  allow_parent_only: true
"""

trigger_plan = """
view: qwat_od.vw_node_element

view: qwat_od.vw_element_installation
  trig_for:
    qwat_od.node
    qwat_od.network_element
    qwat_od.source
    qwat_od.pump
    qwat_od.tank
    qwat_od.treatment
    qwat_od.chamber
    qwat_od.pressurecontrol

view: qwat_od.vw_element_hydrant
    trig_for:
        qwat_od.node
        qwat_od.network_element
        hydrant

view: qwat_od.vw_element_samplingpoint
view: qwat_od.vw_element_meter
view: qwat_od.vw_element_subscriber
view: qwat_od.vw_element_part


"""
# fix_print_with_import

# fix_print_with_import
print(pgiv.PGInheritanceViewRecursive(pg_service, qwat_node_element).sql_all())
