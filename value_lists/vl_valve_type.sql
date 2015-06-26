/*
	qWat - QGIS Water Module

	SQL file :: valve_type table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat_vl.valve_type CASCADE;
CREATE TABLE qwat_vl.valve_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_type ADD CONSTRAINT vl_valve_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.valve_type IS 'Types of valve';

/* COLUMNS */
INSERT INTO qwat_vl.valve_type (id, value_en, value_fr, value_ro )  VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.valve_type (id, value_en, value_fr, value_ro )  VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.valve_type (id, value_en, value_fr, value_ro )  VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6301, 'gate valve',		'vanne à opercule',	'vană cu sertar');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6302, 'clayton valve',	'vanne clayton',	'vană clayton');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6303, 'annular valve',	'vanne annulaire',	'vană inelară');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6306, 'flow control valve',	'limiteur de débit',	'reductor');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6307, 'check valve',	'vanne clapet',         'vană cu clapetă');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6308, '',			'soupape automatique', 	'supapă automată');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6309, '',			'sprinkler',		'sprinkler');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6310, 'valve',		'vanne',		'vană');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, short_fr, value_ro ) VALUES (6311, 'butterfly valve',	'vanne papillon', 'P','vană fluture');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6312, '',			'Elgef',		'Elgef');
INSERT INTO qwat_vl.valve_type ( id, value_en, value_fr, value_ro ) VALUES (6313, '',			'1/4 de tour',  '');

