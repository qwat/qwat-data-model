/*
	qWat - QGIS Water Module
	
	SQL file :: valve maintenance table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.valve_maintenance CASCADE;
CREATE TABLE qwat_vl.valve_maintenance ( id integer not null, CONSTRAINT valve_maintenance_pk PRIMARY KEY (id) );
COMMENT ON TABLE qwat_vl.valve_maintenance IS 'valve maintenance table.';

/* COLUMNS */
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN value_ro VARCHAR(30) default '';
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN priority SMALLINT CHECK (priority > 0 AND priority < 4);
ALTER TABLE qwat_vl.valve_maintenance ADD COLUMN comment  text default '';

/* VALUES */
INSERT INTO qwat_vl.valve_maintenance (id, value_fr, value_ro, priority, comment) VALUES (6201,'Cape fendue','Înveliş crăpat',3,'');
INSERT INTO qwat_vl.valve_maintenance (id, value_fr, value_ro, priority, comment) VALUES (6202,'Joint manquant','Lipsă tijă',2,'');
INSERT INTO qwat_vl.valve_maintenance (id, value_fr, value_ro, priority, comment) VALUES (6203,'Bloquée','Blocată',1,'');


