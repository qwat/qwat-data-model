/*
	qWat - QGIS Water Module
	
	SQL file :: vl_valve_function table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat.vl_valve_function CASCADE;
CREATE TABLE qwat.vl_valve_function ( id integer not null, CONSTRAINT "vl_valve_function_pk" PRIMARY KEY (id));                          
COMMENT ON TABLE qwat.vl_valve_function IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE qwat.vl_valve_function ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_valve_function ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_function ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_function ADD COLUMN value_ro VARCHAR(30) default '';
ALTER TABLE qwat.vl_valve_function ADD COLUMN short_en VARCHAR(5) default '';
ALTER TABLE qwat.vl_valve_function ADD COLUMN short_fr VARCHAR(5) default '';
ALTER TABLE qwat.vl_valve_function ADD COLUMN short_ro VARCHAR(5) default '';
ALTER TABLE qwat.vl_valve_function ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro )                 	VALUES (6101,'vanne de régulation','vană reglaj'); 		/* 1  REG' */
INSERT INTO qwat.vl_valve_function (id, value_fr, short_fr, value_ro )       	VALUES (6102,'ventouse','Ve',''); 				/* 2  VE   */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro )       		VALUES (6103,'vanne by-pass','vană by-pass'); 			/* 3  VBP  */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro, schema_visible ) 	VALUES (6104,'vanne d''ouvrage','vană deschidere','false');	/* 4  OUV  */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro, schema_visible ) 	VALUES (6105,'vanne branchement','vană branşament','false'); 	/* 5  VBR  */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro )                 	VALUES (6106,'prise de secours',''); 				/* 6  SEC  */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro )                 	VALUES (6107,'vanne incendie','vană incendiu'); 		/* 7  VIN  */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro )                 	VALUES (6108,'vanne d''hydrant','vană hidrant'); 		/* 8  VH   */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro )                 	VALUES (6109,'inconnu','necunoscut'); 				/* 9 I     */
INSERT INTO qwat.vl_valve_function (id, value_fr, short_fr,value_ro )        	VALUES (6110,'vidange','Vi','vană golire'); 			/* 10 VID  */
INSERT INTO qwat.vl_valve_function (id, value_fr, value_ro)                  	VALUES (6111,'vanne réseau','vană reţea'); 			/* 11 VR   */
INSERT INTO qwat.vl_valve_function (id, value_fr, short_fr, value_ro)        	VALUES (6112,'vidange-ventouse','ViVe',''); 			/* 12 VIVE */
INSERT INTO qwat.vl_valve_function (id, value_fr,value_ro)                   	VALUES (6113,'vanne clapet','vană clapet'); 			/* 13      */
