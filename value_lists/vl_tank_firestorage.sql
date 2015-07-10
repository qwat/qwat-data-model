/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank auxiliary tables
*/

/* Fire storages */
CREATE TABLE qwat_vl.tank_firestorage () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.tank_firestorage ADD CONSTRAINT vl_tank_firestorage_pk PRIMARY KEY (id);


/* CONTENT */
INSERT INTO qwat_vl.tank_firestorage (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.tank_firestorage (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.tank_firestorage (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2301,'aucune',		      'niciunul');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2302,'cuve 1 entière',	  'cisterna 1 toată');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2303,'cuve 1 partielle',  'cisterna 1 parţial');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2304,'cuve 2 entière',	  'cisterna 2 toată');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2305,'cuve 2 partielle',  'cisterna 2 parţial');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2306,'2 cuves partielles','2 cisterne parţial');
