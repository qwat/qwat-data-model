/*
	qWat - QGIS Water Module

	SQL file :: status table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.part_type CASCADE;
CREATE TABLE qwat_vl.part_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.part_type ADD CONSTRAINT vl_part_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.part_type IS 'table for installation parts. They are supposed to be on top of nodes and might be used to display a specific symbol.';

/* VALUES */

INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9200, '', 'compteur abonné'   , 'număr abonat', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9201, '', 'bouchon'           , 'dop', true);
INSERT INTO qwat_vl.part_type (id, value_en, value_fr, value_ro, vl_active) VALUES (9202, '', 'bouche d''arrosage', 'gură de stropire/pulverizare', true);
