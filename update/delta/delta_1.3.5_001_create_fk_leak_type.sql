ALTER TABLE qwat_od.leak ADD column fk_type integer;

UPDATE qwat_od.leak
SET fk_type = (
CASE
  -- NPS and others from the demo
WHEN type = 'other' THEN 101
WHEN type = 'inconnu' THEN 102
WHEN type = 'to be determined' THEN 103
WHEN type = 'rupture (break, breakage)' THEN 9201
WHEN type = 'crack' THEN 9202
WHEN type = 'hole' THEN 9203
WHEN type = 'default' THEN 9204
END );


/*
 qWat - QGIS Water Module

 SQL file :: leak_type table
*/


CREATE TABLE qwat_vl.leak_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_type ADD CONSTRAINT vl_leak_type_pk PRIMARY KEY (id);

/* Values */
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.leak_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9201, true,'rupture (break, breakage)', 'rupture (cassure, bris)','ruptură (spargere, rupere)');
INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9202, true,'crack', 'fissure','fisură');
INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9203, true,'hole', 'trou','gaură');
INSERT INTO qwat_vl.leak_type (id, vl_active, value_en, value_fr, value_ro) VALUES (9204, true,'default', 'défaut','defect');



ALTER TABLE qwat_od.valve ADD CONSTRAINT valve_fk_leak_type FOREIGN KEY (fk_leak_type) REFERENCES qwat_vl.leak_type(id) MATCH FULL; CREATE INDEX fki_valve_fk_leak_type ON qwat_od.valve(fk_leak_type);
