/*
	qWat - QGIS Water Module

	SQL file :: cover_type table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.cover_type CASCADE;
CREATE TABLE qwat_vl.cover_type ( id integer not null, CONSTRAINT "cover_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat_vl.cover_type IS 'Type of covers';

/* COLUMNS */
ALTER TABLE qwat_vl.cover_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.cover_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.cover_type ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.cover_type ADD COLUMN value_ro VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9801,'couvercle acier','capac oţel');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9802,'couvercle béton','capac beton');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9803,'couvercle plastique','capac plastic');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9804,'couvercle fonte','capac fontă');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9805,'autre','alt tip');
INSERT INTO qwat_vl.cover_type (id, value_fr, value_ro) VALUES (9806,'inconnu','necunoscut');








