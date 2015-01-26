/*
	qWat - QGIS Water Module

	SQL file :: leak_damage table
*/

/* CREATE */
DROP TABLE IF EXISTS qwat_vl.leak_damage CASCADE;
CREATE TABLE qwat_vl.leak_damage ( id integer not null, CONSTRAINT "leak_damage_pk" PRIMARY KEY (id));
COMMENT ON TABLE qwat_vl.leak_damage IS 'en: Damages to leak
ro:  Paguba produsă de avarie';

/* COLUMNS*/
ALTER TABLE qwat_vl.leak_damage ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.leak_damage ADD COLUMN value_fr VARCHAR(30) default '';
ALTER TABLE qwat_vl.leak_damage ADD COLUMN value_en VARCHAR(30) default '';
ALTER TABLE qwat_vl.leak_damage ADD COLUMN value_ro VARCHAR(30) default '';

/* VALUES */
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9121,'aucun','inexistentă');  
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9122,'faible','minoră'); 
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9123,'moyen','medie');  
INSERT INTO qwat_vl.leak_damage (id, value_fr, value_ro) VALUES (9124,'important','importantă');  




