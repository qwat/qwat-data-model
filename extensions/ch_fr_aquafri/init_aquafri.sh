#!/usr/bin/env bash

GNUGETOPT="getopt"
if [[ "$OSTYPE" =~ FreeBSD* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
  GNUGETOPT="/usr/local/bin/getopt"
elif [[ "$OSTYPE" =~ openbsd* ]]; then
  GNUGETOPT="gnugetopt"
fi

# Exit on error
set -e

usage() {
cat << EOF
Usage: $0 [options]

-p|--pgservice       PG service to connect to the database.
-s|--srid            PostGIS SRID. !! AquaFri MUST use MN95 (EPSG:2056) since 2017-01-01 !!
-c|--check		Checks relations between original qwat_vl and custom aquaFri values
-d|--disable     Disable extension without deleting anything
-e|--enable	Enable disabled extension
-r|--drop-schema     Drop schema (cascaded). Carefull, it clears all custom tables and values inserted in qwat_vl.
EOF
}

function ask_confirmation() {
    read -p "$1 ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

ARGS=$(${GNUGETOPT} -o p:s:cder -l "pgservice:,srid:,check,disable,enable,drop-schema" -- "$@");

if [[ $? -ne 0 ]]
then
  usage
  exit 1
fi

eval set -- "$ARGS";

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default values
SRID=2056 #Mandatory
DROPSCHEMA=0
DISABLE=0
ENABLE=0
INSTALL=1
CHECK=0

while true; do
  case "$1" in
    -p|--pgservice)
      shift
      if [[ -n "$1" ]]
      then
        PGSERVICE=$1
        shift
      fi
      ;;
	  ## custom srid is autorized for testing purpose
    -s|--srid)
      shift;
      if [[ -n "$1" ]]; then
        SRID=$1
        shift;
      fi
      ;;
	 -c|--check)
	  CHECK=1
	  INSTALL=0
      shift;
      ;;
    -r|--drop-schema)
      DROPSCHEMA=1
	  INSTALL=0
      shift;
      ;;
	 -d|--disable)
      DISABLE=1
	  INSTALL=0
      shift;
      ;;
	  -e|--enable)
      ENABLE=1
	  INSTALL=0
      shift;
      ;;
    --)
      shift
      break
      ;;
  esac
done

if [[ -z $PGSERVICE ]]; then
  echo "Error: no PG service provided; either use -p or set the PGSERVICE environment variable."
  exit 1
fi

if [[ "$DROPSCHEMA" -eq 1 ]]; then
	
	if [[ "no" == $(ask_confirmation "Are you sure ? It will drop tables z_ouvrage_oaec, z_conduite_oaec, i_centrale_mct, o_hors_reseau and custom values in qwat_vl") || \
		  "no" == $(ask_confirmation "Are you *really* sure ?") ]]
	then
		echo "Skipped."
		exit 0
	fi
	
	## Drop schema after confirmation
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 \
         -c "DROP SCHEMA IF EXISTS qwat_ch_fr_aquafri CASCADE"
		 
	# Drop the ch_fr_aquafri values in qwat_vl
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/disable_values.sh
fi

if [[ "$DISABLE" -eq 1 ]]; then

	# drop the ch_fr_aquafri views
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/drop_views.sql

	# disable the ch_fr_aquafri values in qwat_vl
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/disable_values.sh
fi


if [[ "$ENABLE" -eq 1 ]]; then

	# create the ch_fr_aquafri views
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/insert_views.sh

	# enable the ch_fr_aquafri values in qwat_vl
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/enable_values.sh
fi

if [[ "$CHECK" -eq 1 ]]; then

	# do checks
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/check_relations.sh

fi

if [[ "$INSTALL" -eq 1 ]]; then
	# create the qwat_ch_fr_aquafri schema
	#psql service=$PGSERVICE -v ON_ERROR_STOP=1 -c "CREATE SCHEMA IF NOT EXISTS qwat_ch_fr_aquafri"
	psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/create_schema.sql

	# create the ch_fr_aquafri tables (relations + static)
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/insert_tables.sh

	# create the ch_fr_aquafri views
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/insert_views.sh

	# create the ch_fr_aquafri values in qwat_vl
	PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/enable_values.sh
fi

exit 0
