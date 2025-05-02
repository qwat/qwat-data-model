/*
	qWat - QGIS Water Module
	
	SQL file :: pressure precisionalti
*/

/* CREATE TABLE */
CREATE TABLE qwat_vl.precisionalti () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.precisionalti ADD CONSTRAINT vl_precisionalti_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.precisionalti IS 'precision of altitude';

/* VALUES */
INSERT INTO qwat_vl.precisionalti (id, value_en, value_fr, value_ro ) VALUES (101, 'Other', 'Autre', 'Alta');
INSERT INTO qwat_vl.precisionalti (id, value_en, value_fr, value_ro ) VALUES (102,  'Unknown', 'Inconnu', 'Necunoscută');
INSERT INTO qwat_vl.precisionalti (id, value_en, value_fr, value_ro ) VALUES (103, 'To be determined', 'À déterminer', 'De determinat');

INSERT INTO qwat_vl.precisionalti (id,value_en,value_fr,value_ro) VALUES (1121, 'Unprecised'        ,'Imprécis'             ,'Imprecisă');
INSERT INTO qwat_vl.precisionalti (id,value_en,value_fr,value_ro) VALUES (1122, 'Better than 100 cm','Inférieure à 100 cm'  ,'Mai bună de 100 cm');
INSERT INTO qwat_vl.precisionalti (id,value_en,value_fr,value_ro) VALUES (1123, 'Better than 50 cm' ,'Inférieure à 50 cm'   ,'Mai bună de 50 cm');
INSERT INTO qwat_vl.precisionalti (id,value_en,value_fr,value_ro) VALUES (1124, 'Better than 10 cm' ,'Inférieure à 10 cm'   ,'Mai bună de 10 cm');
INSERT INTO qwat_vl.precisionalti (id,value_en,value_fr,value_ro) VALUES (1125, 'Better than 5 cm'  ,'Inférieure à 5 cm'    ,'Mai bună de 5 cm');

/* SIA405 codes */
UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE value_fr = 'Autre';
UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE value_fr = 'Inconnu';
UPDATE qwat_vl.precisionalti SET sia405code = 'unbekannt' WHERE value_fr = 'À déterminer';
UPDATE qwat_vl.precisionalti SET sia405code = 'ungenau' WHERE value_fr = 'Imprécis';
UPDATE qwat_vl.precisionalti SET sia405code = 'ungenau' WHERE value_fr = 'Inférieure à 100 cm';
UPDATE qwat_vl.precisionalti SET sia405code = 'ungenau' WHERE value_fr = 'Inférieure à 50 cm';
UPDATE qwat_vl.precisionalti SET sia405code = 'genau' WHERE value_fr = 'Inférieure à 10 cm';
UPDATE qwat_vl.precisionalti SET sia405code = 'genau' WHERE value_fr = 'Inférieure à 5 cm';
