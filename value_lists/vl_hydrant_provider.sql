/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant providers table
*/


DROP TABLE IF EXISTS qwat_vl.hydrant_provider CASCADE;
CREATE TABLE qwat_vl.hydrant_provider () INHERITS (qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_provider ADD CONSTRAINT vl_hydrant_provider_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.hydrant_provider IS 'hydrant providers list.';

/* VALUES */
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7101,'+GF+','+GF+','+GF+');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7102,'Wild','Wild','Wild');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7103,'Hawie','Hawie','Hawie');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7104,'Erhard','Erhard','Erhard');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7105,'SISTAG','SISTAG','SISTAG');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7106,'Von Roll','Von Roll','Von Roll');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7107,'Straub','Straub','Straub');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7108,'Hinni','Hinni','Hinni');
INSERT INTO qwat_vl.hydrant_provider (id, value_en, value_fr, value_ro ) VALUES (7109,'AVK','AVK','AVK');



