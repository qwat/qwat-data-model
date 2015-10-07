/*
	qWat - QGIS Water Module

	SQL file :: hydrant_material table
*/


CREATE TABLE qwat_vl.hydrant_material () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_material ADD CONSTRAINT vl_hydrant_material_pk PRIMARY KEY (id);
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN diameter_nominal smallint;
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN code_sire smallint;
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN pressure_nominal double precision;
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN _displayname_en character varying(30);
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN _displayname_fr character varying(30);
ALTER TABLE qwat_vl.hydrant_material ADD COLUMN _displayname_ro character varying(30);
COMMENT ON COLUMN qwat_vl.hydrant_material.pressure_nominal IS 'nominal pressure in bars';

/* Values */
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter_nominal, code_sire, pressure_nominal, _displayname_en, _displayname_fr, _displayname_ro) VALUES (101, true, 'Other', 'Other', 'Autre', 'Autre', 'Altul', 'Altul', NULL, 1, NULL, 'Other', 'Autre', 'Altul');
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter_nominal, code_sire, pressure_nominal, _displayname_en, _displayname_fr, _displayname_ro) VALUES (102, true, 'Unknown', 'Unknown', 'Inc.', 'Inconnu', 'Necunoscut', 'Necunoscut', NULL, 1, NULL, 'Unknown', 'Inc.', 'Nec.');
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter_nominal, code_sire, pressure_nominal, _displayname_en, _displayname_fr, _displayname_ro) VALUES (103, true, 'To determ.', 'To be determined', 'à dét.', 'à déterminer', 'De det.', 'De determinat', NULL, 1, NULL, 'To determ.', 'à dét.', 'De det.');

INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter_nominal, code_sire, pressure_nominal, _displayname_en, _displayname_fr, _displayname_ro) VALUES (7002, true, 'Cast iron', 'Cast iron', 'F', 'Fonte', 'F', 'Fontă', 65, 4, 16, NULL , 'F 65', 'F 65');
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter_nominal, code_sire, pressure_nominal, _displayname_en, _displayname_fr, _displayname_ro) VALUES (7003, true, 'Cast iron', 'Cast iron', 'F', 'Fonte', 'F', 'Fontă', 80, 4, 16, NULL, 'F 80', 'F 80');
INSERT INTO qwat_vl.hydrant_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter_nominal, code_sire, pressure_nominal, _displayname_en, _displayname_fr, _displayname_ro) VALUES (7004, true, 'Cast iron', 'Cast iron', 'F', 'Fonte', 'F', 'Fontă', 100, 4, 16, NULL, 'F 100', 'F 100');





