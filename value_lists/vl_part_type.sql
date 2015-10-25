/*
	qWat - QGIS Water Module

	SQL file :: part type table
*/

/* CREATE */
CREATE TABLE qwat_vl.part_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.part_type ADD CONSTRAINT vl_part_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.part_type IS 'table for installation parts. They are supposed to be on top of nodes and might be used to display a specific symbol.';

/* VALUES */

INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9200, '', 'compteur abonné'   , 'apometru abonat', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9201, '', 'bouchon'           , 'dop', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9202, '', 'bouche d''arrosage', 'gură de stropire/pulverizare', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9203, 'tee fitting', '', 'fiting tip T', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9204, 'elbow fitting', '', 'cot', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9205, 'end fitting', '', 'capăt reţea', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9206, 'reduction fitting', '', 'fiting reductor', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9207, 'cross fitting', '', 'fiting tip cruce', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9208, 'unknown fitting', '', 'fiting nedeterminat', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9209, 'manometer', 'manomètre', 'manometru', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9210, 'flow meter', 'débitmètre', 'debitmetru', true);

