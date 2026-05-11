/*
	qWat - QGIS Water Module
	
	SQL file :: pressure precision
*/

/* CREATE TABLE */
CREATE TABLE qwat_vl.precision () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.precision ADD CONSTRAINT vl_precision_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.precision IS 'pressure precision.';

/* VALUES */
INSERT INTO qwat_vl.precision (id, value_en, value_fr, value_ro ) VALUES (101, 'Other', 'Autre', 'Alta');
INSERT INTO qwat_vl.precision (id,  value_en, value_fr, value_ro ) VALUES (102,'Unknown', 'Inconnu', 'Necunoscută');
INSERT INTO qwat_vl.precision (id, value_en,value_fr, value_ro ) VALUES (103, 'To be determined', 'À déterminer', 'De determinat');

INSERT INTO qwat_vl.precision (id,value_en,value_fr,value_ro) VALUES (1101, 'Unprecise',    'Imprécis',     'Imprecisă');   /*TB: IP => 1 */
INSERT INTO qwat_vl.precision (id,value_en,value_fr,value_ro) VALUES (1102, 'Precise',      'Précis',       'Precisă');     /*TB: P  => 2 */
INSERT INTO qwat_vl.precision (id,value_en,value_fr,value_ro) VALUES (1103, 'Localized',    'Localisé',     'Localizată');  /*TB: L  => 3 */
INSERT INTO qwat_vl.precision (id,value_en,value_fr,value_ro) VALUES (1104, 'Digitalized',  'Digitalisé',   'Digitizată');  /*TB: D  => 4 */

/* SIA405 codes */
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Autre';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Inconnu';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'À déterminer';
UPDATE qwat_vl.precision SET sia405code = 'ungenau' WHERE value_fr = 'Imprécis';
UPDATE qwat_vl.precision SET sia405code = 'genau' WHERE value_fr = 'Précis';
UPDATE qwat_vl.precision SET sia405code = 'geortet' WHERE value_fr = 'Localisé';
UPDATE qwat_vl.precision SET sia405code = 'unbekannt' WHERE value_fr = 'Digitalisé';
