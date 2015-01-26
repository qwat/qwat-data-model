/*
	qWat - QGIS Water Module

	SQL file :: leak_type table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_type CASCADE;
CREATE TABLE qwat_vl.leak_type ( id integer not null, CONSTRAINT "leak_type_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat_vl.leak_type IS 'Types of leak';

/* COLUMNS */
ALTER TABLE qwat_vl.leak_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.leak_type ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.leak_type ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.leak_type ADD COLUMN value_ro VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9141,'cassure franche','spărtură normală');            	/* 1  CF  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9142,'cassure longitudinale','spărtură longitudinală');	/* 2  CL  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9143,'conduite arrachée','conductă smulsă');        	/* 3  CA  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9144,'trou de corrosion','gaură de coroziune');      	/* 4  TC  */
INSERT INTO qwat_vl.leak_type (id, value_fr, value_ro) VALUES (9145,'défectuosité','defect');              		/* 5  DEF */



