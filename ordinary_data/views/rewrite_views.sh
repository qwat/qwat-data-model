#!/bin/bash

set -e 

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

psql -v ON_ERROR_STOP=1 -f ${DIR}/drop_views.sql

${DIR}/insert_views.sh
