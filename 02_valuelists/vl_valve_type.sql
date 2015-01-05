/*
	qWat - QGIS Water Module

	SQL file :: vl_valve_type table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat.vl_valve_type CASCADE;
CREATE TABLE qwat.vl_valve_type ( id integer not null, CONSTRAINT "vl_valve_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat.vl_valve_type IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE qwat.vl_valve_type ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN value_ro VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN short_en VARCHAR(5) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN short_fr VARCHAR(5) default '';
ALTER TABLE qwat.vl_valve_type ADD COLUMN short_ro VARCHAR(5) default '';

/* COLUMNS */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6301, 'vanne à gauche',	'vană la stânga?');      /* 1  VG  */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6302, 'vanne clayton',	'vană clayton');        /* 2  CL  */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6303, 'vanne annulaire',	'vană inelară');        /* 3  VAN */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6304, 'inconnu',		'necunoscut');  	/* 4  I   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6305, 'jauge',		'jojă?');               /* 5  J   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6306, 'limiteur de débit',	'reductor');   		/* 6  LD  */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6307, 'purge', 		'purjare');            	/* 7  PU  */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6308, 'soupape automatique', 	'supapă automatică'); 	/* 8  SA  */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6309, 'sprinkler',		'sprinkler');		/* 9  SP  */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6310, 'vanne',		'vană');		/* 10 V   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, short_fr, value_ro ) VALUES (6311, 'vanne papillon', 'P','vană fluture');/* 11 P   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6312, 'Elgef',		'Elgef');		/* 12 E   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6313, 'arrêt',		'oprire');              /* 13 A   */
INSERT INTO qwat.vl_valve_type ( id, value_fr, value_ro ) VALUES (6314, 'vanne télécommandée',	'vană telecomandată');       /* 14 TEL */


