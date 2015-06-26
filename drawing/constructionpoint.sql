/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_dr.constructionpoint CASCADE;
CREATE TABLE qwat_dr.constructionpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN altitude_real         decimal(10,3)  ;
ALTER TABLE qwat_od.constructionpoint ADD COLUMN fk_altitude_reference integer     ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN code                  varchar(15) ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN measurement_campaign  varchar(200) ;
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN remark                text ;

/* geometry */
SELECT AddGeometryColumn('qwat_dr','constructionpoint','geometry',21781,'POINT',2);
CREATE INDEX constructionpoint_geoidx ON qwat_dr.constructionpoint USING GIST ( geometry );


/* constraints */
ALTER TABLE qwat_dr.constructionpoint ADD CONSTRAINT constructionpoint_fk_altitude_reference FOREIGN KEY (fk_altitude_reference) REFERENCES qwat_vl.altitude_reference(id) MATCH FULL; CREATE INDEX fki_constructionpoint_fk_altitude_reference ON qwat_dr.constructionpoint(fk_altitude_reference);



