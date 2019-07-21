/*
	qWat - QGIS Water Module

	SQL file :: altitude reference table
*/

/* CREATE */
CREATE TABLE qwat_vl.object_reference () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.object_reference ADD CONSTRAINT vl_object_reference_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.object_reference IS 'Reference for object measurements depicting where the measurement took place on the object, with respect to the sea-level';
/* VALUES */
INSERT INTO qwat_vl.object_reference (id, value_en, value_fr, value_ro) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.object_reference (id, value_en, value_fr, value_ro) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.object_reference (id, value_en, value_fr, value_ro) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.object_reference (id, value_fr, value_en, value_ro) VALUES (9001,'radier','apron','radier');
INSERT INTO qwat_vl.object_reference (id, value_fr, value_en, value_ro) VALUES (9002,'sol','ground','sol');
INSERT INTO qwat_vl.object_reference (id, value_fr, value_en, value_ro) VALUES (9003,'dessus de la conduite','on top of pipe','pe conductă');
INSERT INTO qwat_vl.object_reference (id, value_fr, value_en, value_ro) VALUES (9004,'dessus','on top','deasupra');
INSERT INTO qwat_vl.object_reference (id, value_fr, value_en, value_ro) VALUES (9005,'axe de la conduite','pipe axis','axul conductei');




