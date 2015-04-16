/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_cause CASCADE;
CREATE TABLE qwat_vl.leak_cause () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_cause ADD CONSTRAINT vl_leak_cause_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_cause IS 'Causes of leak';

/* VALUES */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9101,'corrosion','coroziune');    /* 1  C  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9102,'manchon','manşonare');     	/* 2  M  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9103,'négligence','neglijenţă');  /* 3  F  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9104,'pose','poziţionare')   ;    /* 4  P  */
INSERT INTO qwat_vl.leak_cause (id,value_fr,value_ro) VALUES (9105,'sous mur','încărcare');     /* 5  S  */



