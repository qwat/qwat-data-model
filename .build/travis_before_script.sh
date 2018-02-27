#!/usr/bin/env bash

set -e

echo "SET client_min_messages TO WARNING;" > ~/.psqlrc

cat > ~/.pg_service.conf << EOF
[qwat_prod]
host=localhost
dbname=qwat_prod
user=postgres

[qwat_test]
host=localhost
dbname=qwat_test
user=postgres

[qwat_comp]
host=localhost
dbname=qwat_comp
user=postgres
EOF

psql -U postgres -c 'CREATE DATABASE qwat_prod'
psql -U postgres -c 'CREATE DATABASE qwat_test'
psql -U postgres -c 'CREATE DATABASE qwat_comp'

psql -U postgres -c 'CREATE ROLE qwat_viewer NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'
psql -U postgres -c 'CREATE ROLE qwat_user NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'
psql -U postgres -c 'CREATE ROLE qwat_manager NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'
psql -U postgres -c 'CREATE ROLE qwat_sysadmin NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION'

pg_dump -V
pg_restore -V

exit 0
