/*
	qWat - QGIS Water Module

	SQL file :: installation pump auxiliary tables
*/

/* PUMP TYPE */
CREATE TABLE qwat_vl.pump_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.pump_type ADD CONSTRAINT vl_pump_type_pk PRIMARY KEY (id);

/* CONTENT */
INSERT INTO qwat_vl.pump_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.pump_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.pump_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.pump_type (id,value_en,value_fr,value_ro) VALUES (2501,'','surpresseur','hidrofor');
INSERT INTO qwat_vl.pump_type (id,value_en,value_fr,value_ro) VALUES (2502,'','normal','normal');
INSERT INTO qwat_vl.pump_type (id,value_en,value_fr,value_ro) VALUES (2503,'','accélération','periferică');




