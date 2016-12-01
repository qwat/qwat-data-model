#!/bin/bash

set -e

for f in *.sql
do
  echo "Updating function $f"
  psql -v ON_ERROR_STOP=1 -v SRID=$SRID -f $f
done

