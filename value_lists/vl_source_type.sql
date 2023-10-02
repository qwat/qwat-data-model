/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
CREATE TABLE qwat_vl.source_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.source_type ADD CONSTRAINT vl_source_type_pk PRIMARY KEY (id);

/* CONTENT */
INSERT INTO qwat_vl.source_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.source_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.source_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.source_type (id,value_fr,value_ro) VALUES (2701, 'captage eau lac', 'captare lac');
INSERT INTO qwat_vl.source_type (id,value_fr,value_ro) VALUES (2702, 'captage eau nappe', 'captare strat freatic');
INSERT INTO qwat_vl.source_type (id,value_fr,value_ro) VALUES (2703, 'captage eau source','captare sursă subterană');
INSERT INTO qwat_vl.source_type (id,value_fr,value_ro) VALUES (2704, 'captage eau rivière','captare râu');

/* SIA405 codes */
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Fluss_Seewasserfassung' WHERE value_fr = 'captage eau lac';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Grundwasserfassung' WHERE value_fr = 'captage eau nappe';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Quellfassung' WHERE value_fr = 'captage eau source';
UPDATE qwat_vl.source_type SET sia405code = 'Fassungsanlage.Fluss_Seewasserfassung' WHERE value_fr = 'captage eau rivière';
