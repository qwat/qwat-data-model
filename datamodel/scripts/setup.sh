#!/usr/bin/env bash
# ##########
#
# QWAT initialization script
# 10.07.2015
# Denis Rouzaud
#
# ##########

GNUGETOPT="getopt"
if [[ "$OSTYPE" =~ FreeBSD* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
	GNUGETOPT="/usr/local/bin/getopt"
elif [[ "$OSTYPE" =~ openbsd* ]]; then
	GNUGETOPT="gnugetopt"
fi

# Exit on error
set -e


usage() {
cat <<EOF
Usage: $0 [options]

-p| --pgservice      PG service to connect to the database.
-s|--srid            PostGIS SRID. Default to 21781 (ch1903)
-d|--drop-schema     drop schemas (cascaded) if they exist
--demo               load some demo data (not complete yet)
-r|--create-roles    create roles in the database
-v|--verbose         be verbose
-n|--no-baseline     If this param is given, then the 1.0.0 baseline is applied instead of current version
EOF

}

ARGS=$(${GNUGETOPT} -o p:s:drvn -l "pgservice:,srid:,drop-schema,create-roles,verbose,demo,no-baseline" -- "$@");
if [ $? -ne 0 ];
then
  usage
  exit 1
fi

eval set -- "$ARGS";

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."
# Default values
SRID=21781
DROPSCHEMA=0
CREATEROLES=0
VERBOSE=0
DEMO=0
NOBASELINE=0
NUMVERSION=$(cat $DIR/system/CURRENT_VERSION.txt)

while true; do
  case "$1" in
    -p|--pgservice)
      shift;
      if [ -n "$1" ]; then
        PGSERVICE=$1
        shift;
      fi
      ;;
     -s|--srid)
      shift;
      if [ -n "$1" ]; then
        SRID=$1
        shift;
      fi
      ;;
    --demo)
      DEMO=1
      shift;
      ;;
    -d|--drop-schema)
      DROPSCHEMA=1
      shift;
      ;;
    -r|--create-roles)
      CREATEROLES=1
      shift;
      ;;
    -v|--verbose)
      VERBOSE=1
      shift;
      ;;
    -n|--no-baseline)
      NOBASELINE=1
      shift;
      ;;
    --)
      shift;
      break;
      ;;
  esac
done


# Check if pum is installed (will fail and stop the script in case of error)
PUM_VERSION=$(pum -v)
echo "PUM version: $PUM_VERSION"
echo

if [[ -z "$PGSERVICE" ]]; then
    echo "No PG service given."
    usage
    exit 0
fi


# config pgsql
if [[ "$VERBOSE" -eq 0 ]]; then
	export PGOPTIONS='--client-min-messages=warning'
fi

# Drop schema
if [[ "$DROPSCHEMA" -eq 1 ]]; then
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "BEGIN; \
	DROP SCHEMA IF EXISTS qwat_dr CASCADE; \
	DROP SCHEMA IF EXISTS qwat_od CASCADE; \
	DROP SCHEMA IF EXISTS qwat_sys CASCADE; \
	DROP SCHEMA IF EXISTS qwat_vl CASCADE; \
	COMMIT;"
fi

# Create extensions
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE EXTENSION IF NOT EXISTS postgis;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c 'CREATE EXTENSION IF NOT EXISTS "pgcrypto";'

# System
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_sys;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/settings.sql
# psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/versions.sql
# psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/versions_insert.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/system/settings_insert.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/audit.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/fn_enable_schemavisible.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/fn_label.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/upgrades_table.sql

echo "Starting qwat_vl insertion..."
# Value lists
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_vl;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/value_list_base.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_object_reference.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_bedding.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_cistern.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_cover_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_document_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_model.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_material.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_output.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_provider.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_leak_cause.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_leak_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_locationtype.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_nominal_diameter.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_overflow.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_part_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_function.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_installmethod.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_material.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_protection.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_precisionalti.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_precision.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pressurecontrol_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_protectionzone_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pump_operating.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pump_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_remote.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_source_quality.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_source_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_status.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_subscriber_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_survey_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_tank_firestorage.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_actuation.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_function.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_maintenance.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_visible.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_watertype.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_worker_type.sql

echo "Starting qwat_dr insertion..."
# Drawings
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_dr;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/annotationline.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/annotationpoint.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/constructionpoint.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/dimension_distance.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/dimension_orientation.sql

echo "Starting qwat_od insertion..."
# Ordinary data
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_od;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/ft_geom3d_altitude.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/ft_alternative_geom.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/worker/od_worker.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_consumptionzone.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_distributor.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_pressurezone.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_district.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_folder.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_printmap.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_protectionzone.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/document/document.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_get_district.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_get_printmap.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_pressurezone.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/nodes/od_node.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/nodes/od_network_element.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_create.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_get_id.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_set_type.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_set_distributors.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_set_status.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_update_id.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_element_part_set_orientation.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/hydrant/od_hydrant.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/pipe/od_pipe.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/pipe/od_pipe_geom.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/pipe/od_crossing.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_pipe_get_id.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_update_pipe_crossing.sql


psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/nodes/od_part.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/od_valve.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/od_meter.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/od_meter_reference.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/subscriber/od_subscriber.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/subscriber/od_subscriber_reference.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_base.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_cover.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_chamber.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_pressurecontrol.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_pump.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_source.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_tank.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_treatment.sql

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_remote.sql


psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/samplingpoint/od_samplingpoint.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/surveypoint/od_surveypoint.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/leak/od_leak.sql

echo "Starting tr_valve_pipe fn_valve_set_orientation..."
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_valve_set_orientation.sql

echo "Starting tr_valve_pipe insertion..."
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/tr_valve_pipe.sql

echo "Starting view creation..."
PGSERVICE=${PGSERVICE} SRID=$SRID ${DIR}/ordinary_data/views/insert_views.sh

# Network
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "CREATE SCHEMA IF NOT EXISTS qwat_network;"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/pipe_reference.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_pipe_.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_all_pipes.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/vw_pipe_reference.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_element_valve_status.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_create_network.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_search_path.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "SELECT qwat_network.ft_all_pipes();"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -c "SELECT qwat_network.ft_create_network()"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_network_cutoff.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_check_node_is_hydrant.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_check_node_is_closed_valve.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_check_node_is_valve.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_check_valve_is_network.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_search_opened_valves.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_check_valve_is_subscriber.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_search_network_and_subscribers.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/network/functions/ft_check_valve_is_active.sql

# Finalize System
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/audit_tables.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/audit_views.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/system/update_sequences.sql

# Baseline PUM
if [[ "$NOBASELINE" -eq 1 ]]; then
    NUMVERSION="1.0.0"
fi
pum baseline -p $PGSERVICE -t qwat_sys.info -d ${DIR}/update/delta -b $NUMVERSION

# Demo data
if [[ "$DEMO" -eq 1 ]]; then
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/demo/minimal.sql
fi

# Create roles
if [[ "$CREATEROLES" -eq 1 ]]; then
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/roles.sql
fi

echo " *** QWAT was successfully initialized! ***"

exit 0
