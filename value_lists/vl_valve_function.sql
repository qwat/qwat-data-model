/*
	qWat - QGIS Water Module
	
	SQL file :: valve_function table
*/


/* CREATE */
DROP TABLE IF EXISTS qwat_vl.valve_function CASCADE;
CREATE TABLE qwat_vl.valve_function () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.valve_function ADD CONSTRAINT vl_valve_function_pk PRIMARY KEY (id);                    
COMMENT ON TABLE qwat_vl.valve_function IS 'Types of valve';

/* COLUMNS*/
ALTER TABLE qwat_vl.valve_function ADD COLUMN schema_visible BOOLEAN NOT NULL default true;

/* VALUES */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 	VALUES (6101,'vanne de régulation','vană reglaj'); 		/* 1  REG' */
INSERT INTO qwat_vl.valve_function (id, value_fr, short_fr, value_ro )       	VALUES (6102,'ventouse','Ve',''); 				/* 2  VE   */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )       		VALUES (6103,'vanne by-pass','vană by-pass'); 			/* 3  VBP  */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro, schema_visible ) 	VALUES (6104,'vanne d''ouvrage','vană deschidere','false');	/* 4  OUV  */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro, schema_visible ) 	VALUES (6105,'vanne branchement','vană branşament','false'); 	/* 5  VBR  */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 	VALUES (6106,'prise de secours',''); 				/* 6  SEC  */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 	VALUES (6107,'vanne incendie','vană incendiu'); 		/* 7  VIN  */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 	VALUES (6108,'vanne d''hydrant','vană hidrant'); 		/* 8  VH   */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro )                 	VALUES (6109,'inconnu','necunoscut'); 				/* 9 I     */
INSERT INTO qwat_vl.valve_function (id, value_fr, short_fr,value_ro )        	VALUES (6110,'vidange','Vi','vană golire'); 			/* 10 VID  */
INSERT INTO qwat_vl.valve_function (id, value_fr, value_ro)                  	VALUES (6111,'vanne réseau','vană reţea'); 			/* 11 VR   */
INSERT INTO qwat_vl.valve_function (id, value_fr, short_fr, value_ro)        	VALUES (6112,'vidange-ventouse','ViVe',''); 			/* 12 VIVE */
INSERT INTO qwat_vl.valve_function (id, value_fr,value_ro)                   	VALUES (6113,'vanne clapet','vană clapet'); 			/* 13      */
