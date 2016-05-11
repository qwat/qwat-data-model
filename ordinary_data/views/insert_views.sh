#!/bin/bash


# Exit on error
set -e


# schematic
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/schematic/vw_pipe_schema.sql


# inheritance
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/inheritance/od_installation_inheritance.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/inheritance/od_node_inheritance.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/inheritance/od_element_inheritance.py ${PGSERVICE})"


# export
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/export/vw_remote.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/export/vw_leak.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/export/vw_consumptionzone.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/export/vw_printmap.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/export/vw_protectionzone.sql

psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_installation.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_valve.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_hydrant.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_meter.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_part.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_pipe.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(./ordinary_data/views/export/export_subscriber.py ${PGSERVICE})"

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/export/search_view.sql


# draw lines
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/draw_lines/vw_subscriber_pipe_relation.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/draw_lines/vw_valve_lines.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ordinary_data/views/draw_lines/vw_pipe_child_parent.sql

