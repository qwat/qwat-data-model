#!/usr/bin/env bash

# Exit on error
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "#### checking : pipe_function ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/pipe_function.sql

echo "#### checking : pipe_material ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/pipe_material.sql

echo "#### checking : precision ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/precision.sql

echo "#### checking : status ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/status.sql

echo "#### checking : hydrant_output ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/hydrant_output.sql

echo "#### checking : remote_type ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/remote_type.sql

echo "#### checking : valve_function ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/valve_function.sql

echo "#### checking : source_type ####"
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/checks/source_type.sql


