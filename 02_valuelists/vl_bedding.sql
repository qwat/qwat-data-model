/*
	qWat - QGIS Water Module

	SQL file :: bedding table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.bedding CASCADE;
CREATE TABLE qwat_vl.bedding ( id integer not null, CONSTRAINT "bedding_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat_vl.bedding IS 'Bedding';

/* COLUMNS */
ALTER TABLE qwat_vl.bedding ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.bedding ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.bedding ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.bedding ADD COLUMN value_ro VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9701,'aucun','lipsă');   
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9702,'béton','beton');   
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9703,'géotextile','geotextil');  
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9704,'gravier','pietriş')   ;  
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9705,'inconnu','necunoscut');    
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9706,'sable','nisip');    
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9707,'terre','pământ');



