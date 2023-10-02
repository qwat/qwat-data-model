/*
	qWat - QGIS Water Module

	SQL file :: document_type table
*/

/* CREATE */
CREATE TABLE qwat_vl.document_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.document_type ADD CONSTRAINT vl_document_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.document_type IS 'document_type table';

/* COLUMNS */
ALTER TABLE qwat_vl.document_type ADD COLUMN active     boolean default true; /* determines if the actual document_type is active or not */

INSERT INTO qwat_vl.document_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.document_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.document_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

/* VALUES */
INSERT INTO qwat_vl.document_type (id, active, value_en, value_fr) VALUES (8001, true, 'Picture', 'Image');
INSERT INTO qwat_vl.document_type (id, active, value_en, value_fr) VALUES (8002, true, 'Video', 'Vidéo');
INSERT INTO qwat_vl.document_type (id, active, value_en, value_fr) VALUES (8003, true, 'Text', 'Texte');
INSERT INTO qwat_vl.document_type (id, active, value_en, value_fr) VALUES (8004, true, 'Sketch', 'Croquis');

