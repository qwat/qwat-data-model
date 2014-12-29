/*
	qWat - QGIS Water Module
	
	SQL file :: vl_remote table
*/

/* Cistern types */
DROP TABLE IF EXISTS qwat.vl_remote CASCADE;
CREATE TABLE qwat.vl_remote (id integer not null, CONSTRAINT "vl_remote_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat.vl_remote ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat.vl_remote ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE qwat.vl_remote ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE qwat.vl_remote ADD COLUMN value_ro varchar(30) default '' ;

/* content */
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1201,'','Aucune','Niciuna');
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1202,'','Cable en site propre','Cablu propriu');
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1203,'','Ligne louée','Linie închiriată');
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1204,'','Ligne commutée','Linie comutată');
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1205,'','ADSL','ADSL');
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1206,'','Radio','Radio');
INSERT INTO qwat.vl_remote (id,value_en,value_fr,value_ro) VALUES (1207,'','GPRS','GPRS');
