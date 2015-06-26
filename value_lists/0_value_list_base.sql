/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.value_list_base CASCADE;
CREATE TABLE qwat_vl.value_list_base ( id integer not null, CONSTRAINT "value_list_base_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat_vl.value_list_base IS 'Master tables for value lists. It will be inherited by value list tables. This table shall not be filled. Be warned that value list table shal have its own unique index on id since PG does not propagate indexes. Therefore unicity of id cannot be garanteed over all value lists.';

/* COLUMNS */
ALTER TABLE qwat_vl.value_list_base ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN short_fr varchar(10) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN short_en varchar(10) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN short_ro varchar(10) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN value_fr varchar(40) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN value_en varchar(40) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN value_ro varchar(40) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN description_fr text ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN description_en text ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN description_ro text ;


