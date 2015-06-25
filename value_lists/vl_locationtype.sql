/*
	qWat - QGIS Water Module
	
	SQL file :: locationtype
*/

DROP TABLE IF EXISTS qwat_vl.locationtype CASCADE;
CREATE TABLE qwat_vl.locationtype () INHERITS ( qwat_vl.value_list_base);
ALTER TABLE qwat_vl.locationtype ADD CONSTRAINT vl_location_pk PRIMARY KEY (id);
COMMENT ON TABLE qwat_vl.locationtype IS 'Location type for water specific elements';

/* CONTENT */
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9601,'none','aucun','niciunul');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9602,'unknown', 'inconnu', 'necunoscută');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9603,'to be determined', 'à déterminer', 'de determinat');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9604,'sidewalk','trottoir','trotuar');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9605,'carriageable','carrossable','carosabil');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9606,'cubic street stones','','piatră cubică');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9607,'gravle','gravier','pietriş');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9608,'sand','sable','nisip');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9609,'soil','terre','pământ');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9610,'concrete','béton','beton');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9611,'open space','espace vert','spaţiu verde');
INSERT INTO qwat_vl.locationtype (id,value_en,value_fr,value_ro) VALUES (9612,'asphalt','asphalte','asfalt');
