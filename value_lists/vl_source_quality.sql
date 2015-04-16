/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source quality */
DROP TABLE IF EXISTS qwat_vl.source_quality CASCADE;
CREATE TABLE qwat_vl.source_quality () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.source_quality ADD CONSTRAINT vl_source_quality_pk PRIMARY KEY (id);

/* COLUMNS */
ALTER TABLE qwat_vl.source_quality ADD COLUMN code_sire smallint              ;

/* CONTENT */
INSERT INTO qwat_vl.source_quality (id,code_sire,value_fr,value_ro) VALUES (2601, 0, 'inconnue', 'necunoscută');
INSERT INTO qwat_vl.source_quality (id,code_sire,value_fr,value_ro) VALUES (2602, 1, 'bonne', 'bună');
INSERT INTO qwat_vl.source_quality (id,code_sire,value_fr,value_ro) VALUES (2603, 2, 'conditionnellement bonne', 'bună condiţionat');
INSERT INTO qwat_vl.source_quality (id,code_sire,value_fr,value_ro) VALUES (2604, 3, 'désinfection obligatoire', 'dezinfecţie obligatorie');
