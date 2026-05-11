/*
	qWat - QGIS Water Module

	SQL file :: valve_actuation table
*/


/* CREATE */
CREATE TABLE qwat_vl.valve_actuation () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_actuation ADD CONSTRAINT vl_valve_actuation_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.valve_actuation IS 'valve actuation/actionnement/acţionare';

/* COLUMNS*/
ALTER TABLE qwat_vl.valve_actuation ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )         VALUES (6401, 'hand control', 'manuel', 'manuală');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )         VALUES (6402, 'left hand control', 'manuel à gauche', 'manuală la stânga');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )       	VALUES (6403, 'electric drive', 'électrique', 'electrică');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )       	VALUES (6404, 'remote controlled', 'télécommandée', 'telecomandată');
INSERT INTO qwat_vl.valve_actuation (id, value_en, value_fr, value_ro )         VALUES (6405, 'automatic', 'automatique', 'automată');

/* SIA405 codes */
UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.valve_actuation SET sia405code = 'unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.valve_actuation SET sia405code = 'mechanisch' WHERE value_fr = 'manuel';
UPDATE qwat_vl.valve_actuation SET sia405code = 'mechanisch' WHERE value_fr = 'manuel à gauche';
UPDATE qwat_vl.valve_actuation SET sia405code = 'motorisch.unbekannt' WHERE value_fr = 'électrique';
UPDATE qwat_vl.valve_actuation SET sia405code = 'motorisch.mit_Fernsteuerung' WHERE value_fr = 'télécommandée';
UPDATE qwat_vl.valve_actuation SET sia405code = 'motorisch.unbekannt' WHERE value_fr = 'automatique';
