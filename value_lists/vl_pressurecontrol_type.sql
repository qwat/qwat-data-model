/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control auxiliary tables
*/

/* CREATE */
CREATE TABLE qwat_vl.pressurecontrol_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.pressurecontrol_type ADD CONSTRAINT vl_pressurecontrol_type_pk PRIMARY KEY (id);

/* VALUES */
INSERT INTO qwat_vl.pressurecontrol_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'altul');
INSERT INTO qwat_vl.pressurecontrol_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscut');
INSERT INTO qwat_vl.pressurecontrol_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.pressurecontrol_type (id,value_en,value_fr,value_ro) VALUES (2801,'reducer'     ,'réducteur'        ,'reductor');
INSERT INTO qwat_vl.pressurecontrol_type (id,value_en,value_fr,value_ro) VALUES (2802,'pressure cut','coupe-pression','tăiere presiune');
INSERT INTO qwat_vl.pressurecontrol_type (id,value_en,value_fr,value_ro) VALUES (2803,'gathering'   ,'rassemblement'    ,'colectare/captare');

/* SIA405 codes */
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_fr = 'autre';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_fr = 'inconnu';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.unbekannt' WHERE value_fr = 'à déterminer';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.Druckbrecher' WHERE value_en = 'reducer';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.Druckbrecher' WHERE value_en = 'pressure cut';
UPDATE qwat_vl.pressurecontrol_type SET sia405code = 'Schacht.Sammel_Spezialschacht' WHERE value_en = 'gathering';
