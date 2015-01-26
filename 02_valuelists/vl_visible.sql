/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/


DROP TABLE IF EXISTS qwat_vl.visible;
CREATE TABLE qwat_vl.visible ( id integer not null, CONSTRAINT "visible_pk" PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

/* COLUMNS */
ALTER TABLE qwat_vl.visible ADD COLUMN vl_code      boolean;
ALTER TABLE qwat_vl.visible ADD COLUMN vl_code_int  smallint;
ALTER TABLE qwat_vl.visible ADD COLUMN value_en varchar(30) default '';
ALTER TABLE qwat_vl.visible ADD COLUMN value_fr varchar(30) default '';
ALTER TABLE qwat_vl.visible ADD COLUMN value_ro varchar(30) default '';

/* CONSTRAINT */
ALTER TABLE qwat_vl.visible ADD CONSTRAINT visible_code UNIQUE (vl_code);
ALTER TABLE qwat_vl.visible ADD CONSTRAINT visible_code_int UNIQUE (vl_code_int);

/* CONTENT */
INSERT INTO qwat_vl.visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1401,NULL,1,'Auto','Auto','Auto');
INSERT INTO qwat_vl.visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1402,True,2,'Visible','Visible','Vizibilă');
INSERT INTO qwat_vl.visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1403,False,0,'Invisible','Invisible','Invizibilă');
