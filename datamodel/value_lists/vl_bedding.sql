/*
	qWat - QGIS Water Module

	SQL file :: bedding table
*/

/* CREATE */
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

/* SIA405 codes */
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'aucun';
UPDATE qwat_vl.bedding SET sia405code = 'Beton' WHERE value_fr = 'béton';
UPDATE qwat_vl.bedding SET sia405code = 'Fliess' WHERE value_fr = 'géotextile';
UPDATE qwat_vl.bedding SET sia405code = 'Betonkies' WHERE value_fr = 'gravier';
UPDATE qwat_vl.bedding SET sia405code = 'Sand' WHERE value_fr = 'sable';
UPDATE qwat_vl.bedding SET sia405code = 'unbekannt' WHERE value_fr = 'terre';
