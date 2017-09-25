#!/usr/bin/env bash


# Exit on error
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# schematic
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/schematic/vw_pipe_schema.sql


# inheritance
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/inheritance/od_all_inheritance.py ${PGSERVICE})"


# export
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/export/vw_consumptionzone.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/export/vw_protectionzone.sql

psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_installation.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_valve.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_hydrant.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_meter.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_part.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_pipe.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_printmap.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_remote.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_subscriber.py ${PGSERVICE})"
psql -v ON_ERROR_STOP=1 -c "$(${DIR}/export/export_leak.py ${PGSERVICE})"  # depends on export_pipe

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/export/search_view.sql


# draw lines
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/draw_lines/vw_subscriber_pipe_relation.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/draw_lines/vw_valve_lines.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/draw_lines/vw_pipe_child_parent.sql
