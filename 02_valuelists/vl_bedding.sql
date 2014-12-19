/*
	qWat - QGIS Water Module

	SQL file :: vl_bedding table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat.vl_bedding CASCADE;
CREATE TABLE qwat.vl_bedding ( id integer not null, CONSTRAINT "vl_bedding_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat.vl_bedding IS 'Bedding';

/* COLUMNS */
ALTER TABLE qwat.vl_bedding ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_bedding ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat.vl_bedding ADD COLUMN value_en VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9701,'aucun');   
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9702,'béton');   
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9703,'géotextile');  
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9704,'gravier')   ;  
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9705,'inconnu');    
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9706,'sable');    
INSERT INTO qwat.vl_bedding (id,value_fr ) VALUES (9707,'terre');    



