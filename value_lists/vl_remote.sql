/*
	qWat - QGIS Water Module
	
	SQL file :: remote table
*/

/* Cistern types */
CREATE TABLE qwat_vl.remote_type () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.remote_type ADD CONSTRAINT vl_remote_type_pk PRIMARY KEY (id);

/* content */
INSERT INTO qwat_vl.remote_type (id, value_en, value_fr, value_ro ) VALUES (101, 'other', 'autre', 'alta');
INSERT INTO qwat_vl.remote_type (id, value_en, value_fr, value_ro ) VALUES (102, 'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.remote_type (id, value_en, value_fr, value_ro ) VALUES (103, 'to be determined', 'à déterminer', 'de determinat');

INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1201,'','Aucune','Niciuna');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1202,'','Cable en site propre','Cablu propriu');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1203,'','Ligne louée','Linie închiriată');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1204,'','Ligne commutée','Linie comutată');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1205,'','ADSL','ADSL');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1206,'','Radio','Radio');
INSERT INTO qwat_vl.remote_type (id,value_en,value_fr,value_ro) VALUES (1207,'','GPRS','GPRS');




