#!/usr/bin/env bash
# ##########
#
# QWAT initilization script
# 10.07.2015
# Denis Rouzaud
#
# ##########

# Exit on error
set -e


usage() {
cat <<EOF
Usage: $0 [options]

-p| --pgservice      PG service to connect to the database.
                     If not given, use current one defined by PGSERVICE env. variable.
-s|--srid            PostGIS SRID. Default to 21781 (ch1903)
-d|--drop-schema     drop schemas (cascaded) if they exist
--demo               load some demo data (not complete yet)
-r|--create-roles    create roles in the database
-v|--verbose         be verbose
EOF

}

ARGS=$(getopt -o p:s:drv -l "pgservice:,srid:,drop-schema,create-roles,verbose,demo" -- "$@");
if [ $? -ne 0 ];
then
  usage
  exit 1
fi

eval set -- "$ARGS";

# Default values
SRID=21781
DROPSCHEMA=0
CREATEROLES=0
VERBOSE=0
DEMO=0

PGSERVICEGIVEN=0

while true; do
  case "$1" in
    -p|--pgservice)
      shift;
      if [ -n "$1" ]; then
        export PGSERVICE=$1
        PGSERVICEGIVEN=1
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

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ "$PGSERVICEGIVEN" -eq 0 ]] && [[ "$DROPSCHEMA" -eq 1 ]]; then
    if [[ -z "$PGSERVICE" ]]; then
		echo "No PG service given, default not defined."
	    usage
	    exit 0
	fi
    read -p "PG service is not explicitly given and schema will be dropped. Are you sure you want to continue ? (y/n) " response
    if [ $response != "y" ]
    then
        exit 0
    fi
fi


# config pgsql
if [[ "$VERBOSE" -eq 0 ]]; then
	export PGOPTIONS='--client-min-messages=warning'
fi

# Drop schema
if [[ "$DROPSCHEMA" -eq 1 ]]; then
	psql -v ON_ERROR_STOP=1 -c "BEGIN; \
	DROP SCHEMA IF EXISTS qwat_dr CASCADE; \
	DROP SCHEMA IF EXISTS qwat_od CASCADE; \
	DROP SCHEMA IF EXISTS qwat_sys CASCADE; \
	DROP SCHEMA IF EXISTS qwat_vl CASCADE; \
	COMMIT;"
fi

# Create extenstions
psql -v ON_ERROR_STOP=1 -c "CREATE EXTENSION IF NOT EXISTS hstore;"
psql -v ON_ERROR_STOP=1 -c "CREATE EXTENSION IF NOT EXISTS postgis;"

# System
psql -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_sys;"
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/settings.sql
# psql -v ON_ERROR_STOP=1 -f ${DIR}/system/versions.sql
# psql -v ON_ERROR_STOP=1 -f ${DIR}/system/versions_insert.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/system/settings_insert.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/audit.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/fn_enable_schemavisible.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/fn_label.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/upgrades_table.sql

# Value lists
psql -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_vl;"
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/value_list_base.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_object_reference.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_bedding.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_cistern.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_cover_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_model.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_material.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_output.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_hydrant_provider.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_leak_cause.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_locationtype.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_overflow.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_part_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_function.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_installmethod.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_material.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pipe_protection.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_precisionalti.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_precision.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pressurecontrol_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_protectionzone_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pump_operating.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_pump_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_remote.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_source_quality.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_source_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_status.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_subscriber_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_survey_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_tank_firestorage.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_actuation.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_function.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_maintenance.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_valve_type.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_visible.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_watertype.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/value_lists/vl_worker_type.sql

# Drawings
psql -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_dr;"
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/annotationline.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/annotationpoint.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/constructionpoint.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/dimension_distance.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/drawing/dimension_orientation.sql

# Ordinary data
psql -v ON_ERROR_STOP=1 -c "CREATE SCHEMA qwat_od;"
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/ft_geom3d_altitude.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/ft_alternative_geom.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/worker/od_worker.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_consumptionzone.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_distributor.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_pressurezone.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_district.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_folder.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_printmap.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/areas/od_protectionzone.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_get_district.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_get_printmap.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_pressurezone.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/nodes/od_node.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/nodes/od_network_element.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_create.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_get_id.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_set_type.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_node_update_id.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/hydrant/od_hydrant.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/pipe/od_pipe.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/pipe/od_pipe_geom.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/pipe/od_crossing.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_pipe_get_id.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_update_pipe_crossing.sql


psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/nodes/od_part.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/od_valve.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/od_meter.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/od_meter_reference.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/subscriber/od_subscriber.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/subscriber/od_subscriber_reference.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_base.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_cover.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_chamber.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_pressurecontrol.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_pump.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_source.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_tank.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_installation_treatment.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/installation/od_remote.sql


psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/samplingpoint/od_samplingpoint.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/surveypoint/od_surveypoint.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/leak/od_leak.sql

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/functions/fn_valve_set_orientation.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/ordinary_data/valve/tr_valve_pipe.sql


SRID=$SRID ${DIR}/ordinary_data/views/insert_views.sh



# Finalize System
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/audit_tables.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/audit_views.sql
psql -v ON_ERROR_STOP=1 -f ${DIR}/system/update_sequences.sql

# Baseline PUM

pum baseline -p qwat_prod -t qwat_sys.info -d ${DIR}/update/delta -b 1.3.0


# Demo data
if [[ "$DEMO" -eq 1 ]]; then
	psql -v ON_ERROR_STOP=1 -f ${DIR}/demo/minimal.sql
fi

# Create roles
if [[ "$CREATEROLES" -eq 1 ]]; then
	psql -v ON_ERROR_STOP=1 -f ${DIR}/roles.sql
fi

echo " *** QWAT was successfuly initialized! ***"

exit 0
