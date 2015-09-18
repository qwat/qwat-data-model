#!/bin/bash

# Exit on error
set -e

# PARAMS (cannot user PGSERVICE with pg_restore)
SRCDB=qwat
DESTDB=qwat_test
USER=sige
HOST=172.24.171.203

TODAY=`date '+%Y%m%d'`

# LOGGED ACTIONS
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_sys_loggedactions.backup" --table "qwat_sys.logged_actions" "$SRCDB"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error "$TODAY""_sys_loggedactions.backup"

# ORDINARY DATA
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_od.backup" --schema "qwat_od" \
--exclude-table="qwat_od.installation_building" \
--exclude-table="qwat_od.installation_chamber" \
--exclude-table="qwat_od.installation_pressurecontrol" \
--exclude-table="qwat_od.installation_pump" \
--exclude-table="qwat_od.installation_source" \
--exclude-table="qwat_od.installation_tank" \
--exclude-table="qwat_od.installation_treatment" \
--exclude-table="qwat_od.installation_chamber_data" \
--exclude-table="qwat_od.installation_pressurecontrol_data" \
--exclude-table="qwat_od.installation_pump_data" \
--exclude-table="qwat_od.installation_source_data" \
--exclude-table="qwat_od.installation_tank_data" \
--exclude-table="qwat_od.installation_treatment_data" "$SRCDB";
  
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "TRUNCATE TABLE qwat_od.node_table";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_building_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_chamber_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_pressurecontrol_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_pump_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_source_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_tank_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "CREATE SEQUENCE qwat_od.installation_treatment_id_seq";

/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --schema qwat_od "$TODAY""_od.backup"

psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_building_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_chamber_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_pressurecontrol_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_pump_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_source_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_tank_id_seq";
psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "DROP SEQUENCE qwat_od.installation_treatment_id_seq";

/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --inserts --column-inserts --verbose --file "20150911_installation_data.backup" \
	--table "qwat_od.installation_chamber_data"\
	--table "qwat_od.installation_pressurecontrol_data"\
	--table "qwat_od.installation_pump_data"\
	--table "qwat_od.installation_source_data" \
	--table "qwat_od.installation_tank_data" \
	--table "qwat_od.installation_treatment_data" "qwat"
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password --disable-triggers --single-transaction --exit-on-error --schema qwat_od "20150911_installation_data.backup"

psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "
insert into qwat_od.vw_installation_chamber 
(id,
fk_object_reference,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
networkseparation,
meter,
depth,
no_valves)
SELECT
id,
102,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
networkseparation,
meter,
depth,
no_valves
FROM qwat_od.installation_chamber_data"

psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "
insert into qwat_od.vw_installation_pressurecontrol 
(id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_pressurecontrol_type)
SELECT
id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_type
FROM qwat_od.installation_pressurecontrol_data"


psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "
insert into qwat_od.vw_installation_pump
(id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_pump_type,     
fk_pipe_in   ,    
fk_pipe_out   ,   
fk_operating   ,  
no_pumps        , 
rejected_flow    ,
manometric_height
)
SELECT
id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_type  ,   
fk_pipe_in     ,  
fk_pipe_out   ,   
fk_operating    , 
no_pumps         ,
rejected_flow    ,
manometric_height
FROM qwat_od.installation_pump_data"


psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "
insert into qwat_od.vw_installation_source
(id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_source_type   ,
fk_quality      , 
flow_lowest    ,  
flow_average    ,    
flow_concession , 
contract_end     ,
gathering_chamber

)
SELECT
id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_type   ,
fk_quality    ,   
flow_lowest   ,   
flow_mean     ,   
flow_concession  ,
contract_end     ,
gathering_chamber
FROM qwat_od.installation_source_data"


psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "
insert into qwat_od.vw_installation_tank
(id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
fk_overflow      ,   
fk_firestorage   ,   
storage_total    ,   
storage_supply   ,   
storage_fire       , 
altitude_overflow   ,
altitude_apron      ,
height_max          ,
fire_valve          ,
fire_remote         ,
_litrepercm         ,
cistern1_fk_type    ,
cistern1_dimension_1,
cistern1_dimension_2,
cistern1_storage    ,
_cistern1_litrepercm,
cistern2_fk_type    ,
cistern2_dimension_1,
cistern2_dimension_2,
cistern2_storage    ,
_cistern2_litrepercm
)
SELECT
id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude_apron,
remark,
open_water_surface,
geometry,
--specific
fk_overflow      ,   
fk_firestorage   ,   
storage_total    ,   
storage_supply   ,   
storage_fire       , 
altitude_overflow   ,
altitude_apron      ,
height_max          ,
fire_valve          ,
fire_remote         ,
_litrepercm         ,
cistern1_fk_type    ,
cistern1_dimension_1,
cistern1_dimension_2,
cistern1_storage    ,
_cistern1_litrepercm,
cistern2_fk_type    ,
cistern2_dimension_1,
cistern2_dimension_2,
cistern2_storage    ,
_cistern2_litrepercm          
FROM qwat_od.installation_tank_data"

psql --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" -c "
insert into qwat_od.vw_qwat_installation
(installation_type,
id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
sanitization_uv         ,     
sanitization_chlorine_liquid ,
sanitization_chlorine_gazeous,
sanitization_ozone         ,  
filtration_membrane     ,     
filtration_sandorgravel   ,   
flocculation           ,      
activatedcharcoal  ,          
settling                ,     
treatment_capacity       
)
SELECT
'treatment',
id,
name,
identification,
fk_status,
fk_distributor,
fk_remote,
fk_watertype,
year,
year_end,
parcel,
eca,
altitude,
remark,
open_water_surface,
geometry,
--specific
sanitization_uv ,             
sanitization_chlorine_liquid ,
sanitization_chlorine_gazeous,
sanitization_ozone      ,     
filtration_membrane    ,      
filtration_sandorgravel ,     
flocculation      ,           
activatedcharcoal    ,        
settling        ,             
treatment_capacity           
FROM qwat_od.installation_treatment_data"





# DRAWING
/usr/bin/pg_dump --host $HOST --port 5432 --username "$USER" --format custom --file "$TODAY""_dr.backup" --schema "qwat_dr" "$SRCDB";
/usr/bin/pg_restore  --host $HOST --port 5432 --username "$USER" --dbname "$DESTDB" --no-password  --data-only --disable-triggers --single-transaction --exit-on-error --schema qwat_dr "$TODAY""_dr.backup"
