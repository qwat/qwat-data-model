/*
	qWat - QGIS Water Module
	
	SQL file :: overflow
*/

CREATE TABLE qwat_vl.overflow () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.overflow ADD CONSTRAINT vl_overflow_pk PRIMARY KEY (id);

/* VALUES */
INSERT INTO qwat_vl.overflow (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.overflow (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.overflow (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.overflow (id,value_en,value_fr,value_ro) VALUES (2201,'dumped','en décharge','aruncată');
INSERT INTO qwat_vl.overflow (id,value_en,value_fr,value_ro) VALUES (2202,'collected','récupéré','recuperată');





