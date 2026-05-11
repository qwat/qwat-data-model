/*
	qWat - QGIS Water Module

	SQL file :: leak_type table
*/

/* CREATE */
CREATE TABLE qwat_vl.leak_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_type ADD CONSTRAINT vl_leak_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_type IS 'leak types';

/* VALUES */
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro) VALUES (9201,'rupture (break, breakage)', 'rupture (cassure, bris)','ruptură (spargere, rupere)');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro) VALUES (9202,'crack', 'fissure','fisură');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro) VALUES (9203,'hole', 'trou','gaură');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro) VALUES (9204,'default', 'défaut','defect');




