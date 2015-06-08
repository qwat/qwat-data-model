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
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6301, 'vanne à gauche',	'vană la stânga?');      /* 1  VG  */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6302, 'vanne clayton',	'vană clayton');        /* 2  CL  */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6303, 'vanne annulaire',	'vană inelară');        /* 3  VAN */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6304, 'inconnu',		'necunoscut');  	/* 4  I   */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6305, 'jauge',		'jojă?');               /* 5  J   */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6306, 'limiteur de débit',	'reductor');   		/* 6  LD  */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6308, 'soupape automatique', 	'supapă automatică'); 	/* 8  SA  */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6309, 'sprinkler',		'sprinkler');		/* 9  SP  */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6310, 'vanne',		'vană');		/* 10 V   */
INSERT INTO qwat_vl.valve_type ( id, value_fr, short_fr, value_ro ) VALUES (6311, 'vanne papillon', 'P','vană fluture');/* 11 P   */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6312, 'Elgef',		'Elgef');		/* 12 E   */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6313, 'arrêt',		'oprire');              /* 13 A   */
INSERT INTO qwat_vl.valve_type ( id, value_fr, value_ro ) VALUES (6314, 'vanne télécommandée',	'vană telecomandată');       /* 14 TEL */


