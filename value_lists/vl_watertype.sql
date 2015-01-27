/*
	qWat - QGIS Water Module
	
	SQL file :: watertype table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.watertype CASCADE;
CREATE TABLE qwat_vl.watertype ( id integer not null, CONSTRAINT watertype_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.watertype IS 'Water type table, with SIRE code.';

/* COLUMNS */
ALTER TABLE qwat_vl.watertype ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.watertype ADD COLUMN value_en  varchar(30) default '';
ALTER TABLE qwat_vl.watertype ADD COLUMN value_fr  varchar(30) default '';
ALTER TABLE qwat_vl.watertype ADD COLUMN value_ro  varchar(30) default '';
ALTER TABLE qwat_vl.watertype ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro, code_sire) VALUES (1501, 'raw'      , 'brute'       , 'brută', 	0 );
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro, code_sire) VALUES (1502, 'drinkable', 'potable'     , 'potabilă', 	1 );
INSERT INTO qwat_vl.watertype (id, value_en, value_fr, value_ro, code_sire) VALUES (1503, 'industrial', 'industrielle','industrială',	2 );
