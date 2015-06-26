/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_cause CASCADE;
CREATE TABLE qwat_vl.leak_cause () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_cause ADD CONSTRAINT vl_leak_cause_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_cause IS 'Causes of leak';

/* VALUES */
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9101,'cassure franche','spărtură normală');            
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9102,'cassure longitudinale','spărtură longitudinală');
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9103,'conduite arrachée','conductă smulsă');   
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9104,'corrosion','gaură de coroziune');      	
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9105,'raccordement non étanche','defect 1');           
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9106,'pièce non étanche','defect 2');           
INSERT INTO qwat_vl.leak_cause (id, value_fr, value_ro) VALUES (9107,'autre','');           








