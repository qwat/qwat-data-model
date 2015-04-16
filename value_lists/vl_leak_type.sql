/*
	qWat - QGIS Water Module

	SQL file :: leak_type table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_type CASCADE;
CREATE TABLE qwat_vl.leak_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_type ADD CONSTRAINT vl_leak_type_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_type IS 'Types of leak';

/* VALUES */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9141,'cassure franche','spărtură normală');            	/* 1  CF  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9142,'cassure longitudinale','spărtură longitudinală');	/* 2  CL  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9143,'conduite arrachée','conductă smulsă');        	/* 3  CA  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9144,'trou de corrosion','gaură de coroziune');      	/* 4  TC  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9145,'défectuosité','defect');              		/* 5  DEF */



