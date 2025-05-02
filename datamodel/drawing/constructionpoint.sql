/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_dr.constructionpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN altitude         decimal(10,3)  ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN fk_object_reference integer     ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN code                  varchar(15) ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN measurement_campaign  varchar(200) ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN remark                text ;

/* geometry */
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN geometry geometry('POINTZ',:SRID);
CREATE INDEX constructionpoint_geoidx ON qwat_dr.constructionpoint USING GIST ( geometry );


/* constraints */
ALTER TABLE qwat_dr.constructionpoint ADD CONSTRAINT constructionpoint_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_constructionpoint_fk_object_reference ON qwat_dr.constructionpoint(fk_object_reference);



