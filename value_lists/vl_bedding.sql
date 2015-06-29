/*
	qWat - QGIS Water Module

	SQL file :: bedding table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.bedding CASCADE;
CREATE TABLE qwat_vl.bedding () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.bedding ADD CONSTRAINT vl_bedding_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.bedding IS 'Bedding';
/* VALUES */
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (9701,'none','aucun','lipsă');
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (9702,'concrete','béton','beton');
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (9703,'geotextile','géotextile','geotextil');
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (9704,'gravle','gravier','pietriş') ;
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (9706,'sand','sable','nisip');
INSERT INTO qwat_vl.bedding (id, value_en, value_fr, value_ro ) VALUES (9707,'soil','terre','pământ');



