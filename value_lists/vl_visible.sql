/*
	qWat - QGIS Water Module
	
	SQL file :: boolean tables for value relation in qgis
*/

/*----------------!!!---!!!----------------*/


DROP TABLE IF EXISTS qwat_vl.visible;
CREATE TABLE qwat_vl.visible () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.visible ADD CONSTRAINT vl_visible_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.visible IS 'Table for editing in qgis tri state boolean (NULL/True/False) by using value relation.';

/* COLUMNS */
ALTER TABLE qwat_vl.visible ADD COLUMN vl_code      boolean;
ALTER TABLE qwat_vl.visible ADD COLUMN vl_code_int  smallint;

/* CONSTRAINT */
ALTER TABLE qwat_vl.visible ADD CONSTRAINT visible_code UNIQUE (vl_code);
ALTER TABLE qwat_vl.visible ADD CONSTRAINT visible_code_int UNIQUE (vl_code_int);

/* CONTENT */
INSERT INTO qwat_vl.visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1401,NULL,1,'Auto','Auto','Auto');
INSERT INTO qwat_vl.visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1402,True,2,'Visible','Visible','Vizibilă');
INSERT INTO qwat_vl.visible (id,vl_code,vl_code_int,value_en,value_fr,value_ro) VALUES (1403,False,0,'Invisible','Invisible','Invizibilă');
