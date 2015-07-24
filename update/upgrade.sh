#!/bin/bash

# Exit on error
set -e

# PARAMS (cannot user PGSERVICE with pg_restore)
SRCDB=qwat_old
DESTDB=qwat
USER=sige
HOST=172.24.171.203

TODAY=`date '+%Y%m%d'`

# LOGGED ACTIONS
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_sys_loggedactions.backup" --table "qwat_sys.logged_actions" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error "$TODAY""_sys_loggedactions.backup"

# ORDINARY DATA
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_od.backup" --schema "qwat_od" "$SRCDB";
psql -c "TRUNCATE TABLE qwat_od.node_table";
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --schema qwat_od "$TODAY""_od.backup"

# DRAWING
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_dr.backup" --schema "qwat_dr" "$SRCDB";
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --schema qwat_dr "$TODAY""_dr.backup"
