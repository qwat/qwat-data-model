/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.construction_point (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.construction_point IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE qwat_od.construction_point ADD COLUMN altitude         decimal(10,3)  ;
ALTER TABLE qwat_od.construction_point ADD COLUMN fk_object_reference integer     ;
ALTER TABLE qwat_od.construction_point ADD COLUMN code                  varchar(15) ;
ALTER TABLE qwat_od.construction_point ADD COLUMN measurement_campaign  varchar(200) ;
ALTER TABLE qwat_od.construction_point ADD COLUMN remark                text ;

/* geometry */
ALTER TABLE qwat_od.construction_point ADD COLUMN geometry geometry('POINTZ',:SRID);
CREATE INDEX constructionpoint_geoidx ON qwat_od.construction_point USING GIST ( geometry );

/* constraints */
ALTER TABLE qwat_od.construction_point ADD CONSTRAINT constructionpoint_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_constructionpoint_fk_object_reference ON qwat_od.construction_point(fk_object_reference);
