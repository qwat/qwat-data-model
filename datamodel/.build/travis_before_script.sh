#!/usr/bin/env bash

set -e

# Create a PostgreSQL service file
cat > $PGSERVICEFILE << EOF
[postgres]
host=localhost
dbname=postgres
user=postgres
password=postgres

[qwat_prod]
host=localhost
dbname=qwat_prod
user=postgres
password=postgres

[qwat_test]
host=localhost
dbname=qwat_test
user=postgres
password=postgres

[qwat_comp]
host=localhost
dbname=qwat_comp
user=postgres
password=postgres
EOF

echo "SET client_min_messages TO WARNING;" > ~/.psqlrc

psql service=postgres -c 'CREATE DATABASE qwat_prod'
psql service=postgres -c 'CREATE DATABASE qwat_test'
psql service=postgres -c 'CREATE DATABASE qwat_comp'

psql service=postgres -c 'CREATE ROLE qwat_viewer NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'
psql service=postgres -c 'CREATE ROLE qwat_user NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'
psql service=postgres -c 'CREATE ROLE qwat_manager NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'
psql service=postgres -c 'CREATE ROLE qwat_sysadmin NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'

pg_dump -V
pg_restore -V

exit 0
