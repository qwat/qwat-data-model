/*
	qWat - QGIS Water Module
	
	SQL file :: pressure precisionalti
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_vl.precisionalti CASCADE;
CREATE TABLE qwat_vl.precisionalti (id integer not null, CONSTRAINT "precisionalti_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.precisionalti IS 'pressure precisionalti.';

/* COLUMNS */
ALTER TABLE qwat_vl.precisionalti ADD COLUMN vl_active      boolean default true;
ALTER TABLE qwat_vl.precisionalti ADD COLUMN value_en       varchar(30) default '';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN value_fr       varchar(30) default '';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN value_ro       varchar(30) default '';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN description_en varchar(30) default '';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN description_fr varchar(30) default '';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN description_ro varchar(30) default '';
ALTER TABLE qwat_vl.precisionalti ADD COLUMN code_sire      smallint ;

/* VALUES */
INSERT INTO qwat_vl.precisionalti (id,code_sire,value_en,value_fr,value_ro) VALUES (1121,1, 'Unprecised'        ,'Imprécis'		,'Imprecisă');  
INSERT INTO qwat_vl.precisionalti (id,code_sire,value_en,value_fr,value_ro) VALUES (1122,0, 'Better than 100 cm','Inférieure à 100 cm'	,'Mai bună de 100 cm');    
INSERT INTO qwat_vl.precisionalti (id,code_sire,value_en,value_fr,value_ro) VALUES (1123,0, 'Better than 50 cm' ,'Inférieure à 50 cm'	,'Mai bună de 50 cm');     
INSERT INTO qwat_vl.precisionalti (id,code_sire,value_en,value_fr,value_ro) VALUES (1124,0, 'Better than 10 cm' ,'Inférieure à 10 cm'	,'Mai bună de 10 cm');     
INSERT INTO qwat_vl.precisionalti (id,code_sire,value_en,value_fr,value_ro) VALUES (1125,0, 'Better than 5 cm'  ,'Inférieure à 5 cm'	,'Mai bună de 5 cm');     
INSERT INTO qwat_vl.precisionalti (id,code_sire,value_en,value_fr,value_ro) VALUES (1126,1, 'Unknown'           ,'Inconnue'		,'Necunoscută');   


