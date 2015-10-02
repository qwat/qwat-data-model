#!/usr/bin/bash

# Exit on error
set -e

# PARAMS (cannot user PGSERVICE with pg_restore)
SRCDB=qwat
DESTDB=qwat_test
USER=sige
HOST=172.24.171.203

TODAY=`date '+%Y%m%d'`


# initialize QWAT
./init_qwat.sh -p qwat_test -d -v


# CREATE MIGRATION SCHEMA ON DESTINATION AND SOURCE DBs
/usr/bin/psql --host $HOST --port 5432 -c "CREATE SCHEMA IF NOT EXISTS qwat_migration" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE SCHEMA IF NOT EXISTS qwat_migration" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE EXTENSION IF NOT EXISTS dblink" $DESTDB $USER



# LOGGED ACTIONS
# /usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_sys_loggedactions.backup" --table "qwat_sys.logged_actions" "$SRCDB"
# /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error "$TODAY""_sys_loggedactions.backup"



# ORDINARY DATA - 
echo "migrate distributor, pressurezones, etc...."
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.distributor" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.pressurezone" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.district" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.folder" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.printmap" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.protectionzone" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.remote" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"

# PIPES
echo "migrate pipes..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.pipe_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.pipe_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.pipe_data AS (SELECT * FROM qwat_od.pipe)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_pipe_data.backup" --table "qwat_migration.pipe_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_pipe_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.pipe_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
# remove fields
sed -i 's/, _district,/,/g' field_list
sed -i 's/, _pressurezone,/,/g' field_list
# alter columns
cp field_list src_fields
cp field_list dest_fields
sed -i 's/, geometry,/,ST_Force3d(geometry),/g' src_fields
sed -i 's/, geometry_alt1,/,ST_Force3d(geometry_alt1),/g' src_fields
sed -i 's/, geometry_alt2/,ST_Force3d(geometry_alt2)/g' src_fields
echo "ALTER TABLE qwat_od.pipe DISABLE TRIGGER ALL;
	INSERT INTO qwat_od.pipe (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.pipe_data;
	ALTER TABLE qwat_od.pipe ENABLE TRIGGER ALL;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER

echo "migrate crossing, leaks..."
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.crossing" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "data.backup" --table "qwat_od.leak" "$SRCDB"; /usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --data-only --single-transaction --exit-on-error "data.backup"

# TODO: hydrantes, meter, part (=>element), samplingpoint, subscriber, valve, meter_reference, subscriber_reference

# hydrantes
echo "migrate hydrants..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.hydrant_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.hydrant_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.hydrant_data AS (SELECT * FROM qwat_od.hydrant)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_hydrant_data.backup" --table "qwat_migration.hydrant_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_hydrant_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.hydrant_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
# remove fields
sed -i 's/, _district,/,/g' field_list
sed -i 's/, _pressurezone,/,/g' field_list
sed -i 's/, fk_node,/,/g' field_list
# alter columns
cp field_list src_fields
cp field_list dest_fields
sed -i 's/, geometry,/,ST_Force3d(geometry),/g' src_fields
sed -i 's/, geometry_alt1,/,ST_Force3d(geometry_alt1),/g' src_fields
sed -i 's/, geometry_alt2/,ST_Force3d(geometry_alt2)/g' src_fields
echo "--ALTER TABLE qwat_od.hydrant DISABLE TRIGGER ALL;
	INSERT INTO qwat_od.vw_element_hydrant (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.hydrant_data;
	ALTER TABLE qwat_od.hydrant ENABLE TRIGGER ALL;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER



# INSTALLATIONS
/usr/bin/psql -v ON_ERROR_STOP=on --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.installation_data;" $SRCDB $USER
/usr/bin/psql -v ON_ERROR_STOP=on --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.installation_data;" $DESTDB $USER
/usr/bin/psql -v ON_ERROR_STOP=on --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.installation_data AS (SELECT * FROM qwat_od.vw_qwat_installation)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_installation_data.backup" --table "qwat_migration.installation_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_installation_data.backup"
# get field list
/usr/bin/psql -v ON_ERROR_STOP=on --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.installation_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
# remove fields
sed -i 's/, id,/,/g' field_list
sed -i 's/fk_node,//g' field_list
sed -i 's/fk_parent,//g' field_list
sed -i 's/, _district,/,/g' field_list
sed -i 's/, _installation_type_short,/,/g' field_list
# alter columns
cp field_list src_fields
cp field_list dest_fields
sed -i 's/, geometry,/,ST_Force3d(geometry),/g' src_fields
sed -i 's/, geometry_alt1,/,ST_Force3d(geometry_alt1),/g' src_fields
sed -i 's/, geometry_alt2,/,ST_Force3d(geometry_alt2),/g' src_fields
echo "ALTER TABLE qwat_od.node DISABLE TRIGGER ALL;
	INSERT INTO qwat_od.vw_element_installation (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.installation_data;
	ALTER TABLE qwat_od.node ENABLE TRIGGER ALL;" >> cmd.sql
/usr/bin/psql -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER




exit





# DRAWING
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_dr.backup" --schema "qwat_dr" "$SRCDB";
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --schema qwat_dr "$TODAY""_dr.backup"
