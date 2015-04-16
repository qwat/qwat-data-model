/*
	qWat - QGIS Water Module
	
	SQL file :: overflow
*/

DROP TABLE IF EXISTS qwat_vl.overflow CASCADE;
CREATE TABLE qwat_vl.overflow () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.overflow ADD CONSTRAINT vl_overflow_pk PRIMARY KEY (id);

/* CONTENT */
INSERT INTO qwat_vl.overflow (id,value_en,value_fr,value_ro) VALUES (2201,'dumped','en décharge','aruncată');
INSERT INTO qwat_vl.overflow (id,value_en,value_fr,value_ro) VALUES (2202,'collected','récupéré','recuperată');
