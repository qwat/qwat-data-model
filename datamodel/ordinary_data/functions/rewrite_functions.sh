#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for f in ${DIR}/*.sql
do
  echo "Updating function $f"
  psql service=${PGSERVICE} -v ON_ERROR_STOP=1 -v SRID=$SRID -f $f
done

