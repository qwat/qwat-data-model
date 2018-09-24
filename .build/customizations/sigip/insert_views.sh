#!/usr/bin/env bash

# Exit on error
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/damage.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/hydrant.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/installation.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/leak.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/part.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/pipe.sql
psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/valve.sql
