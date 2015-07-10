/*
	qWat - QGIS Water Module
	
	SQL file :: worker_type table
*/


/* CREATE */
CREATE TABLE qwat_vl.worker_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.worker_type ADD CONSTRAINT vl_worker_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.worker_type IS 'type for worker.';


/* VALUES */
INSERT INTO qwat_vl.worker_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.worker_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.worker_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.worker_type (id,value_en,value_fr,value_ro) VALUES (8001,'leaks repairing','','rezolvare avarii');
INSERT INTO qwat_vl.worker_type (id,value_en,value_fr,value_ro) VALUES (8002,'valves checking','','verificare vane');
INSERT INTO qwat_vl.worker_type (id,value_en,value_fr,value_ro) VALUES (8003,'hydrants checking','','verificare hidranti');
