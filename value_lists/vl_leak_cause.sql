/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_cause CASCADE;
CREATE TABLE qwat_vl.leak_cause ( id integer not null, CONSTRAINT "leak_cause_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat_vl.leak_cause IS 'Causes of leak';

/* COLUMNS */
ALTER TABLE qwat_vl.leak_cause ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.leak_cause ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.leak_cause ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.leak_cause ADD COLUMN value_ro VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9101,'corrosion','coroziune');    /* 1  C  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9102,'manchon','manşonare');     	/* 2  M  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9103,'négligence','neglijenţă');  /* 3  F  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9104,'pose','poziţionare')   ;    /* 4  P  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9105,'sous mur','încărcare');     /* 5  S  */



