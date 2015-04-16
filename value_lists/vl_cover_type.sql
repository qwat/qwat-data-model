/*
	qWat - QGIS Water Module

	SQL file :: cover_type table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.cover_type CASCADE;
CREATE TABLE qwat_vl.cover_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.cover_type ADD CONSTRAINT vl_cover_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.cover_type IS 'Type of covers';


/* VALUES */
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9801,'couvercle acier','capac oţel');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9802,'couvercle béton','capac beton');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9803,'couvercle plastique','capac plastic');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9804,'couvercle fonte','capac fontă');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9805,'autre','alt tip');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9806,'inconnu','necunoscut');








