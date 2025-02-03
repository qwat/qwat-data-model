/*
	qWat - QGIS Water Module

	SQL file :: hydrant_output table
*/


CREATE TABLE qwat_vl.hydrant_output () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.hydrant_output ADD CONSTRAINT vl_hydrant_output_pk PRIMARY KEY (id);

/* Values */
INSERT INTO qwat_vl.hydrant_output (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.hydrant_output (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.hydrant_output (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7401,'1x75','1x75');
INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7402,'2x75','2x75');
INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7403,'3x75','3x75');
INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7404,'2x55','2x55');
INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7405,'1x55_1x75','1x55_1x75');
INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7406,'2x55_1x75','2x55_1x75');
INSERT INTO qwat_vl.hydrant_output (id,value_fr,value_ro) VALUES (7407,'2x55_1x100','2x55_1x100');


