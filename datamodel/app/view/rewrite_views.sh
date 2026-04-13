#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -f ${DIR}/drop_views.sql
PGSERVICE=${PGSERVICE} SRID=${SRID} ${DIR}/insert_views.sh
