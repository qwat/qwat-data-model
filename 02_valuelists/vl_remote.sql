/*
	qWat - QGIS Water Module
	
	SQL file :: remote table
*/

/* Cistern types */
DROP TABLE IF EXISTS qwat_vl.remote_type CASCADE;
CREATE TABLE qwat_vl.remote_type (id integer not null, CONSTRAINT "remote_type_pk" PRIMARY KEY (id) );

/* COLUMNS */
ALTER TABLE qwat_vl.remote_type ADD COLUMN vl_active boolean default true;
ALTER TABLE qwat_vl.remote_type ADD COLUMN value_fr varchar(30) default '' ;
ALTER TABLE qwat_vl.remote_type ADD COLUMN value_en varchar(30) default '' ;
ALTER TABLE qwat_vl.remote_type ADD COLUMN value_ro varchar(30) default '' ;

/* content */
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1201,'','Aucune','Niciuna');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1202,'','Cable en site propre','Cablu propriu');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1203,'','Ligne louée','Linie închiriată');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1204,'','Ligne commutée','Linie comutată');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1205,'','ADSL','ADSL');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1206,'','Radio','Radio');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1207,'','GPRS','GPRS');
