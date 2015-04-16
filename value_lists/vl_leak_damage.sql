/*
	qWat - QGIS Water Module

	SQL file :: leak_damage table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_damage CASCADE;
CREATE TABLE qwat_vl.leak_damage () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.leak_damage ADD CONSTRAINT vl_leak_damage_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.leak_damage IS 'en: Damages to leak
ro:  Paguba produsă de avarie';

/* VALUES */
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9121,'aucun','inexistentă');  
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9122,'faible','minoră'); 
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9123,'moyen','medie');  
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9124,'important','importantă');  




