/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant providers table
*/


DROP TABLE IF EXISTS qwat_vl.hydrant_provider CASCADE;
CREATE TABLE qwat_vl.hydrant_provider () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_provider ADD CONSTRAINT vl_hydrant_provider_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.hydrant_provider IS 'hydrant providers list.';

/* Columns */
ALTER TABLE qwat_vl.hydrant_provider ADD COLUMN name varchar(30) not null;

/* Constraints */
ALTER TABLE qwat_vl.hydrant_provider ADD CONSTRAINT hydrant_provider_name UNIQUE (name);


INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7101,'+GF+');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7102,'Wild');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7103,'Hawie');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7104,'Erhard');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7105,'SISTAG');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7106,'Von Roll');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7107,'Straub');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7108,'Hinni');
INSERT INTO qwat_vl.hydrant_provider (id,name) VALUES (7109,'AVK');



