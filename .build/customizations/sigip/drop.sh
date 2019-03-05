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
EOF
}

ARGS=$(${GNUGETOPT} -o p: -l "pgservice:" -- "$@");
if [[ $? -ne 0 ]]
then
  usage
  exit 1
fi

eval set -- "$ARGS";

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default values
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
    --)
      shift
      break
      ;;
  esac
done

if [[ -z $PGSERVICE ]]
then
  echo "Error: no PG service provided; either use -p or set the PGSERVICE environment variable."
  exit 1
fi

# Drop the schema
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 \
	-c "DROP SCHEMA IF EXISTS qwat_sigip CASCADE"

# Drop the table qwat_od.damage 
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 \
	-c "DROP TABLE IF EXISTS qwat_od.damage CASCADE"

exit 0
