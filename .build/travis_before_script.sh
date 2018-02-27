#!/usr/bin/env bash

set -e

echo "SET client_min_messages TO WARNING;" > ~/.psqlrc

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
