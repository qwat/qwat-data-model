/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank auxiliary tables
*/

/* Cistern types */
DROP TABLE IF EXISTS qwat_vl.cistern CASCADE;
CREATE TABLE qwat_vl.cistern () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.cistern ADD CONSTRAINT vl_cistern_pk PRIMARY KEY (id);

/* content */
INSERT INTO qwat_vl.cistern (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.cistern (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.cistern (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.cistern (id, value_en, value_fr, value_ro) VALUES (2101,'circular','circulaire','circulară');
INSERT INTO qwat_vl.cistern (id, value_en, value_fr, value_ro) VALUES (2102,'rectangular','rectangulaire','dreptunghiulară');




