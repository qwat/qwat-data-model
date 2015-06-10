/*
	qWat - QGIS Water Module
	
	SQL file :: valve_actuation table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat_vl.valve_actuation CASCADE;
CREATE TABLE qwat_vl.valve_actuation () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_actuation ADD CONSTRAINT vl_valve_actuation_pk PRIMARY KEY (id);                    
COMMENT ON TABLE qwat_vl.valve_actuation IS 'valve actuation/actionnement/acţionare';

/* COLUMNS*/
ALTER TABLE qwat_vl.valve_actuation ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )         VALUES (6401, 'hand control', 'manuel', 'manuală');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )         VALUES (6402, 'left hand control', 'manuel à gauche', 'manuală la stânga');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )       	VALUES (6403, 'electric drive', 'électrique', 'electrică');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )       	VALUES (6404, 'remote controlled', 'télécommandée', 'telecomandată');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro ) 	VALUES (6405, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro ) 	VALUES (6406, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )         VALUES (6407, 'to be determined', 'à déterminer', 'de determinat');
