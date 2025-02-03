/*
	qWat - QGIS Water Module

	SQL file :: watertype table
*/

/* CREATE */
CREATE TABLE qwat_vl.watertype () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.watertype ADD CONSTRAINT vl_watertype_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.watertype IS 'Water type table, with SIRE code.';

/* VALUES */
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro) VALUES (1501, 'raw'      , 'brute'       , 'brută');
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro) VALUES (1502, 'drinkable', 'potable'     , 'potabilă');
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro) VALUES (1503, 'industrial', 'industrielle','industrială');

/* SIA405 codes */
UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.watertype SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.watertype SET sia405code = 'Rohwasser' WHERE value_fr = 'brute';
UPDATE qwat_vl.watertype SET sia405code = 'Trinkwasser' WHERE value_fr = 'potable';
UPDATE qwat_vl.watertype SET sia405code = 'Industriebrauchwasser' WHERE value_fr = 'industrielle';
