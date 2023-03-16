#!/usr/bin/env bash

# This script aims at transforming QWAT data from EPSG:21781 to EPSG:2056 (MN03 to MN95)
# It should be used with caution and is not given with any warranty, backup your data prior to any usage
# This script should be adapted with your server connection parameters

# Install Fineltra extension as described here
# http://kleinerpreisonline.de/blog/2015/10/04/bezugsrahmenwechsel-st-fineltra-in-action.html
# https://github.com/strk/fineltra

# En plus du service qwat, créer qwat_2056 et qwat_21781 avec les bases correspondantes utilisées pour les transferts

# Define PG SERVICES
INITIAL_21781=qwat
COPY_21781=qwat_21781
FINAL_2056=qwat_2056

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# CREATE A COPY OF QWAT IN 21781
PGSERVICE=${INITIAL_21781} psql -c "DROP DATABASE IF EXISTS qwat_21781;"
PGSERVICE=${INITIAL_21781} psql -c "CREATE DATABASE qwat_21781 WITH TEMPLATE qwat OWNER sige;"

PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -f $DIR/../ordinary_data/views/drop_views.sql

PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_dimension_distance ON qwat_dr.dimension_distance;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_remote_altgeom_update ON qwat_od.remote;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_remote_altgeom_alt ON qwat_od.remote;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS surveypoint_altitude_update_trigger ON qwat_od.surveypoint;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS cover_altitude_update_trigger ON qwat_od.cover;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_node_altgeom_update ON qwat_od.node;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_node_geom_update ON qwat_od.node;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_pipe_node_moved ON qwat_od.node;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_node_altgeom_alt ON qwat_od.node;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS valve_handle_altitude_update_trigger ON qwat_od.valve;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_valve_infos_update_trigger ON qwat_od.valve;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_valve_add_pipe_vertex_update ON qwat_od.valve;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_valve_altgeom_update ON qwat_od.valve;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_valve_altgeom_alt ON qwat_od.valve;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_valve_pipe_update ON qwat_od.pipe;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_pipe_altgeom_update ON qwat_od.pipe;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_pipe_geom_update ON qwat_od.pipe;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_pipe_node_type_update ON qwat_od.pipe;"
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -c "DROP TRIGGER IF EXISTS tr_pipe_altgeom_alt ON qwat_od.pipe;"

# DO TRANSFORM 2056
PGSERVICE=${COPY_21781} psql -v ON_ERROR_STOP=1 -f $DIR/srid_21781_to_2056.sql

# DUMP DB IN 2056
/usr/bin/pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format custom --blobs --verbose --file "qwat_21781_data.backup" --schema "qwat_ch_vd_sire" --schema "qwat_dr" --schema "qwat_od" "qwat_21781"
/usr/bin/pg_dump --host 172.24.171.203 --port 5432 --username "sige" --no-password  --format custom --blobs --verbose --file "qwat_21781_sys.backup" --table "qwat_sys.logged_actions" "qwat_21781"

# create empty QWAT DB
$DIR/../init_qwat.sh -p ${FINAL_2056} -s 2056 -d

# SIGE specials
PGSERVICE=${FINAL_2056} psql -v ON_ERROR_STOP=1 -c "ALTER TABLE qwat_od.hydrant ADD COLUMN model character varying(30);"

/usr/bin/pg_restore --host 172.24.171.203 --port 5432 --username "sige" --dbname "${FINAL_2056}" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --verbose "qwat_21781_data.backup"
/usr/bin/pg_restore --host 172.24.171.203 --port 5432 --username "sige" --dbname "${FINAL_2056}" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --verbose "qwat_21781_sys.backup"



exit
