/*
	qWat - QGIS Water Module

	SQL file :: leak_cause table
*/

/* CREATE */
CREATE TABLE qwat_vl.leak_cause () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_cause ADD CONSTRAINT vl_leak_cause_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_cause IS 'Causes of leak';

/* VALUES */
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro) VALUES (9101,'clean break', 'cassure franche','spărtură normală');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro) VALUES (9102,'longitudinal break', 'cassure longitudinale','spărtură longitudinală');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro) VALUES (9103,'pipe ripped', 'conduite arrachée','conductă smulsă');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro) VALUES (9104,'corrosion', 'corrosion','coroziune');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro) VALUES (9105,'leaking connection', 'raccordement non étanche','racordare neetanșă');
INSERT INTO qwat_vl.leak_cause (id, value_en, value_fr, value_ro) VALUES (9106,'leaking part', 'pièce non étanche','piesă neetanșă');




