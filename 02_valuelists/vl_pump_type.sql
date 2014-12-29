/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* PUMP TYPE */
DROP TABLE IF EXISTS qwat.vl_pump_type CASCADE;
CREATE TABLE qwat.vl_pump_type (id integer not null, CONSTRAINT vl_pump_type_pk PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat.vl_pump_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_pump_type ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE qwat.vl_pump_type ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE qwat.vl_pump_type ADD COLUMN value_ro  varchar(30) default '' ;
ALTER TABLE qwat.vl_pump_type ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO qwat.vl_pump_type (id,code_sire,value_en,value_fr,value_ro) VALUES (2501,0,'','surpresseur','hidrofor');
INSERT INTO qwat.vl_pump_type (id,code_sire,value_en,value_fr,value_ro) VALUES (2502,1,'','normal','normal');
INSERT INTO qwat.vl_pump_type (id,code_sire,value_en,value_fr,value_ro) VALUES (2503,2,'','accélération','periferică');
