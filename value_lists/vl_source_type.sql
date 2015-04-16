/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
DROP TABLE IF EXISTS qwat_vl.source_type CASCADE;
CREATE TABLE qwat_vl.source_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.source_type ADD CONSTRAINT vl_source_type_pk PRIMARY KEY (id);

/* COLUMNS */
ALTER TABLE qwat_vl.source_type ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2701,0, 'captage eau lac', 'captare lac');
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2702,1, 'captage eau nappe', 'captare strat freatic');
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2703,2, 'captage eau source','captare sursă subterană');
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2704,3, 'captage eau rivière','captare râu');
