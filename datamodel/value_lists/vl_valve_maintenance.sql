/*
	qWat - QGIS Water Module
	
	SQL file :: valve maintenance table
*/

/* CREATE */
CREATE TABLE qwat_vl.valve_maintenance () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_maintenance ADD CONSTRAINT vlvalve_maintenance_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.valve_maintenance IS 'valve maintenance table.';

/* COLUMNS */
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN priority SMALLINT CHECK (priority > 0 AND priority < 4);

/* VALUES */
INSERT INTO qwat_vl.valve_maintenance (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.valve_maintenance (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.valve_maintenance (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.valve_maintenance (id, value_fr, value_ro, priority) VALUES (6201,'Cape fendue','Înveliş crăpat',3);
INSERT INTO qwat_vl.valve_maintenance (id, value_fr, value_ro, priority) VALUES (6202,'Joint manquant','Lipsă tijă',2);
INSERT INTO qwat_vl.valve_maintenance (id, value_fr, value_ro, priority) VALUES (6203,'Bloquée','Blocată',1);




