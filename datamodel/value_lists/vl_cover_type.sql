/*
	qWat - QGIS Water Module

	SQL file :: cover_type table
*/

/* CREATE */
CREATE TABLE qwat_vl.cover_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.cover_type ADD CONSTRAINT vl_cover_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.cover_type IS 'Type of covers';


/* VALUES */
INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro) VALUES (9801,'steel cover','couvercle acier','capac oţel');
INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro) VALUES (9802,'concrete cover','couvercle béton','capac beton');
INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro) VALUES (9803,'plastic cover','couvercle plastique','capac plastic');
INSERT INTO qwat_vl.cover_type (id, value_en, value_fr, value_ro) VALUES (9804,'cast-iron cover','couvercle fonte','capac fontă');




