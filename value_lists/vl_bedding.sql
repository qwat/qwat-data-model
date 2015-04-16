/*
	qWat - QGIS Water Module

	SQL file :: bedding table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.bedding CASCADE;
CREATE TABLE qwat_vl.bedding () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.bedding ADD CONSTRAINT vl_bedding_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.bedding IS 'Bedding';
/* VALUES */
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9701,'aucun','lipsă');   
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9702,'béton','beton');   
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9703,'géotextile','geotextil');  
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9704,'gravier','pietriş')   ;  
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9705,'inconnu','necunoscut');    
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9706,'sable','nisip');    
INSERT INTO qwat_vl.bedding (id,value_fr, value_ro) VALUES (9707,'terre','pământ');



