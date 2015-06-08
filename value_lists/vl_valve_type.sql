/*
	qWat - QGIS Water Module

	SQL file :: valve_type table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat_vl.valve_type CASCADE;
CREATE TABLE qwat_vl.valve_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_type ADD CONSTRAINT vl_valve_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.valve_type IS 'Types of valves';

/* COLUMNS */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6301, 'vanne à gauche',    'vană la stânga?');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6302, 'vanne clayton',      'vană clayton');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6303, 'vanne annulaire',    'vană inelară');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6304, 'inconnu',            'necunoscut');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6305, 'jauge',              'jojă?');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6306, 'limiteur de débit',  'reductor');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6113, 'vanne clapet',       'vană clapet');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6308, 'soupape automatique','supapă automatică');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6309, 'sprinkler',		    'sprinkler');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6310, 'vanne',		        'vană');
INSERT INTO qwat_vl.valve_type ( id, value_fr, short_fr, value_ro ) VALUES (6311,'vanne papillon', 'P', 'vană fluture');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6312, 'Elgef',		        'Elgef');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6313, 'arrêt',		        'oprire');
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro )           VALUES (6314, 'vanne télécommandée','vană telecomandată');

