#!/bin/bash

set -e 

psql -v ON_ERROR_STOP=1 -f drop_views.sql

./insert_views.sh
