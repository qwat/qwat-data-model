/*
	qWat - QGIS Water Module

	SQL file :: installation sources auxiliary tables
*/

/* source type */
DROP TABLE IF EXISTS qwat_vl.source_type CASCADE;
CREATE TABLE qwat_vl.source_type (id integer not null, CONSTRAINT "source_type_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat_vl.source_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.source_type ADD COLUMN value_en  varchar(30) default '' ;
ALTER TABLE qwat_vl.source_type ADD COLUMN value_fr  varchar(30) default '' ;
ALTER TABLE qwat_vl.source_type ADD COLUMN value_ro  varchar(30) default '' ;
ALTER TABLE qwat_vl.source_type ADD COLUMN code_sire smallint               ;

/* CONTENT */
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2701,0, 'captage eau lac', 'captare lac');
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2702,1, 'captage eau nappe', 'captare strat freatic');
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2703,2, 'captage eau source','captare sursă subterană');
INSERT INTO qwat_vl.source_type (id,code_sire,value_fr,value_ro) VALUES (2704,3, 'captage eau rivière','captare râu');
