/*
	qWat - QGIS Water Module
	
	SQL file :: installation tank auxiliary tables
*/

/* Fire storages */
DROP TABLE IF EXISTS qwat_vl.tank_firestorage CASCADE;
CREATE TABLE qwat_vl.tank_firestorage (id integer not null, CONSTRAINT tank_firestorage_pk PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat_vl.tank_firestorage ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.tank_firestorage ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE qwat_vl.tank_firestorage ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE qwat_vl.tank_firestorage ADD COLUMN value_ro varchar(30) default '' ;

/* CONTENT */
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2301,'aucune',		'niciunul');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2302,'cuve 1 entière',	'cisterna 1 toată');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2303,'cuve 1 partielle',	'cisterna 1 parţial');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2304,'cuve 2 entière',	'cisterna 2 toată');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2305,'cuve 2 partielle',	'cisterna 2 parţial');
INSERT INTO qwat_vl.tank_firestorage (id,value_fr,value_ro) VALUES (2306,'2 cuves partielles',	'2 cisterne parţial');
