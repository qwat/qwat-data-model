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
./init_qwat.sh -p qwat_test -d

export PGOPTIONS='--client-min-messages=warning'

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

# TODO:  meter_reference, subscriber_reference

# samplingpoints
echo "migrate samplingpoints..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.samplingpoint_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.samplingpoint_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.samplingpoint_data AS (SELECT * FROM qwat_od.samplingpoint)" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "ALTER TABLE qwat_migration.samplingpoint_data ADD COLUMN fk_distributor integer default 1" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "ALTER TABLE qwat_migration.samplingpoint_data ADD COLUMN fk_status integer default 1301" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_samplingpoint_data.backup" --table "qwat_migration.samplingpoint_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_samplingpoint_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.samplingpoint_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
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
echo "INSERT INTO qwat_od.vw_element_samplingpoint (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.samplingpoint_data;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER


# meters
echo "migrate meters..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.meter_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.meter_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.meter_data AS (SELECT * FROM qwat_od.meter)" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "ALTER TABLE qwat_migration.meter_data ADD COLUMN fk_distributor integer default 1" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_meter_data.backup" --table "qwat_migration.meter_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_meter_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.meter_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
# remove fields
sed -i 's/, _district,/,/g' field_list
sed -i 's/, _pressurezone,/,/g' field_list
sed -i 's/, fk_node,/,/g' field_list
sed -i 's/, _identification_full,/,/g' field_list
# alter columns
cp field_list src_fields
cp field_list dest_fields
sed -i 's/, geometry,/,ST_Force3d(geometry),/g' src_fields
sed -i 's/, geometry_alt1,/,ST_Force3d(geometry_alt1),/g' src_fields
sed -i 's/, geometry_alt2/,ST_Force3d(geometry_alt2)/g' src_fields
echo "INSERT INTO qwat_od.vw_element_meter (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.meter_data;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER

# subscribers
echo "migrate subscribers..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.subscriber_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.subscriber_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.subscriber_data AS (SELECT * FROM qwat_od.subscriber)" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "ALTER TABLE qwat_migration.subscriber_data ADD COLUMN fk_distributor integer default 1" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_subscriber_data.backup" --table "qwat_migration.subscriber_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_subscriber_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.subscriber_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
# remove fields
sed -i 's/, _district,/,/g' field_list
sed -i 's/, _pressurezone,/,/g' field_list
sed -i 's/, fk_node,/,/g' field_list
sed -i 's/, _identification_full,/,/g' field_list
# alter columns
cp field_list src_fields
cp field_list dest_fields
sed -i 's/, geometry,/,ST_Force3d(geometry),/g' src_fields
sed -i 's/, geometry_alt1,/,ST_Force3d(geometry_alt1),/g' src_fields
sed -i 's/, geometry_alt2/,ST_Force3d(geometry_alt2)/g' src_fields
sed -i 's/, fk_type/,fk_subscriber_type/g' dest_fields
echo "INSERT INTO qwat_od.vw_element_subscriber (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.subscriber_data;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER

# meter_references
echo "migrate meter_references..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.meter_reference_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.meter_reference_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.meter_reference_data AS (SELECT * FROM qwat_od.meter_reference)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_meter_reference_data.backup" --table "qwat_migration.meter_reference_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_meter_reference_data.backup"
/usr/bin/psql --host $HOST --port 5432 -c "
	INSERT INTO qwat_od.meter_reference ( geometry, fk_meter ) 
	SELECT ref.geometry, meter.id
	FROM qwat_migration.meter_reference_data ref
	LEFT JOIN qwat_migration.meter_data old_data ON ref.fk_meter = old_data.id
	LEFT JOIN qwat_od.vw_element_meter meter ON ST_Equals(old_data.geometry, meter.geometry) IS TRUE; " $DESTDB $USER

# subscriber_references
echo "migrate subscriber_references..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.subscriber_reference_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.subscriber_reference_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.subscriber_reference_data AS (SELECT * FROM qwat_od.subscriber_reference)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_subscriber_reference_data.backup" --table "qwat_migration.subscriber_reference_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_subscriber_reference_data.backup"
/usr/bin/psql --host $HOST --port 5432 -c "
	INSERT INTO qwat_od.subscriber_reference ( geometry, fk_subscriber ) 
	SELECT ref.geometry, subscriber.id
	FROM qwat_migration.subscriber_reference_data ref
	LEFT JOIN qwat_migration.subscriber_data old_data ON ref.fk_subscriber = old_data.id
	LEFT JOIN qwat_od.vw_element_subscriber subscriber ON ST_Equals(old_data.geometry, subscriber.geometry) IS TRUE; " $DESTDB $USER
	
	
# hydrants
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
echo "INSERT INTO qwat_od.vw_element_hydrant (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.hydrant_data;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER

# valves
echo "migrate valves..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.valve_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.valve_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.valve_data AS (SELECT * FROM qwat_od.valve)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_valve_data.backup" --table "qwat_migration.valve_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_valve_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.valve_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
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
sed -i 's/, fk_type/,fk_valve_type/g' dest_fields
sed -i 's/, fk_function/,fk_valve_function/g' dest_fields
sed -i 's/, fk_node_precision/,fk_precision/g' dest_fields
sed -i 's/, geometry_handle/,handle_geometry/g' dest_fields
echo "INSERT INTO qwat_od.vw_element_valve (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.valve_data;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER

# parts
echo "migrate parts..."
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.part_data;" $SRCDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "DROP TABLE IF EXISTS qwat_migration.part_data;" $DESTDB $USER
/usr/bin/psql --host $HOST --port 5432 -c "CREATE TABLE qwat_migration.part_data AS (SELECT * FROM qwat_od.part)" $SRCDB $USER
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_part_data.backup" --table "qwat_migration.part_data" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error "$TODAY""_part_data.backup"
# get field list
/usr/bin/psql --host $HOST --port 5432 --tuples-only -o field_list -c "SELECT array_to_string(ARRAY(SELECT attname FROM pg_attribute WHERE attrelid = 'qwat_migration.part_data'::regclass AND attnum > 0 ORDER BY attnum ASC), ', ')" $DESTDB $USER
# remove fields
sed -i 's/, _district,/,/g' field_list
sed -i 's/, _pressurezone,/,/g' field_list
sed -i 's/, fk_node,/,/g' field_list
sed -i 's/, orientation,/,/g' field_list
sed -i 's/, fk_pipe,/,/g' field_list
# alter columns
cp field_list src_fields
cp field_list dest_fields
sed -i 's/, geometry,/,ST_Force3d(geometry),/g' src_fields
sed -i 's/, geometry_alt1,/,ST_Force3d(geometry_alt1),/g' src_fields
sed -i 's/, geometry_alt2/,ST_Force3d(geometry_alt2)/g' src_fields
sed -i 's/, fk_type/,fk_part_type/g' dest_fields
echo "INSERT INTO qwat_od.vw_element_part (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.part_data;" >> cmd.sql
/usr/bin/psql  -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER


# INSTALLATIONS
echo "migrate installation..."
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
echo "INSERT INTO qwat_od.vw_element_installation (" > cmd.sql
cat dest_fields >> cmd.sql
echo ") SELECT " >> cmd.sql
cat src_fields >> cmd.sql
echo " FROM qwat_migration.installation_data;" >> cmd.sql
/usr/bin/psql -v ON_ERROR_STOP=on --host $HOST --port 5432 -f cmd.sql $DESTDB $USER




exit





# DRAWING
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_dr.backup" --schema "qwat_dr" "$SRCDB";
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --schema qwat_dr "$TODAY""_dr.backup"
