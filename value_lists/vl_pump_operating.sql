/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* PUMP OPERATING */
DROP TABLE IF EXISTS qwat_vl.pump_operating CASCADE;
CREATE TABLE qwat_vl.pump_operating () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.pump_operating ADD CONSTRAINT vl_pump_operating_pk PRIMARY KEY (id);

/* COLUMNS */
ALTER TABLE qwat_vl.pump_operating ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO qwat_vl.pump_operating (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.pump_operating (id, code_sire, value_en, value_fr, value_ro ) VALUES (102, 0, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.pump_operating (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.pump_operating (id,code_sire,value_en,value_fr,value_ro) VALUES (2402,1,'alternative','alterné','alternativ');
INSERT INTO qwat_vl.pump_operating (id,code_sire,value_en,value_fr,value_ro) VALUES (2403,2,'parallel','parallèle','paralel');




