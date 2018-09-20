#!/usr/bin/env bash

# Exit on error
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/conduite.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vanne_clapet.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/regulation_pression.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/station_pompage.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/station_traitement.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/reservoir.sql
psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/captage.sql
