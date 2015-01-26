/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* PUMP OPERATING */
DROP TABLE IF EXISTS qwat_vl.pump_operating CASCADE;
CREATE TABLE qwat_vl.pump_operating (id integer not null, CONSTRAINT pump_operating_pk PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat_vl.pump_operating ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.pump_operating ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE qwat_vl.pump_operating ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE qwat_vl.pump_operating ADD COLUMN value_ro  varchar(30) default '' ;
ALTER TABLE qwat_vl.pump_operating ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO qwat_vl.pump_operating (id,code_sire,value_en,value_fr,value_ro) VALUES (2401,0,'unknown','inconnu','necunoscut');
INSERT INTO qwat_vl.pump_operating (id,code_sire,value_en,value_fr,value_ro) VALUES (2402,1,'alternative','alterné','alternativ');
INSERT INTO qwat_vl.pump_operating (id,code_sire,value_en,value_fr,value_ro) VALUES (2403,2,'parallel','parallèle','paralel');
