/*
	qWat - QGIS Water Module

	SQL file :: hydrant_material table
*/


CREATE TABLE qwat_vl.hydrant_material () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_material ADD CONSTRAINT vl_hydrant_material_pk PRIMARY KEY (id);
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN pressure_nominal;
COMMENT ON COLUMN qwat_vl.hydrant_material.pressure_nominal IS 'nominal pressure in bars';

/* Values */
INSERT INTO qwat_vl.hydrant_material (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.hydrant_material (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.hydrant_material (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, pressure_nominal) VALUES (7002, true, 'CI 65',  'Cast iron 65',  'F 65',  'Fonte 65',  'F 65',  'Fontă 65',  16);
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, pressure_nominal) VALUES (7003, true, 'CI 80',  'Cast iron 80',  'F 80',  'Fonte 80',  'F 80',  'Fontă 80',  16);
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, pressure_nominal) VALUES (7004, true, 'CI 100', 'Cast iron 100', 'F 100', 'Fonte 100', 'F 100', 'Fontă 100', 16);





