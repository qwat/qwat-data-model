/*
	qWat - QGIS Water Module
	
	SQL file :: survey_type table
*/

/* CREATE */
CREATE TABLE qwat_vl.survey_type () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.survey_type ADD CONSTRAINT vl_survey_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.survey_type IS 'Water type table, with SIRE code.';

/* COLUMNS */
ALTER TABLE qwat_vl.survey_type ADD COLUMN code_sire smallint;

/* VALUES */
INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (9901, 'GPS'      , 'GPS'       , 'GPS' );
INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (9902, 'measuring tape', 'ruban métrique'     , 'ruletă');
INSERT INTO qwat_vl.survey_type (id, value_en, value_fr, value_ro ) VALUES (9903, 'total station', 'station totale'     , 'stație totală');

