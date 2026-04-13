/*
	qWat - QGIS Water Module
	
	SQL file :: constructionline arcs
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.construction_line (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.construction_line IS 'construction lines are artificials lines to build objects.';

/* columns */
ALTER TABLE qwat_od.construction_line ADD COLUMN altitude         decimal(10,3)  ;
ALTER TABLE qwat_od.construction_line ADD COLUMN fk_object_reference integer     ;
ALTER TABLE qwat_od.construction_line ADD COLUMN code                  varchar(15) ;
ALTER TABLE qwat_od.construction_line ADD COLUMN measurement_campaign  varchar(200) ;
ALTER TABLE qwat_od.construction_line ADD COLUMN remark                text ;

/* geometry */
ALTER TABLE qwat_od.construction_line ADD COLUMN geometry geometry('LineStringZ',:SRID);
CREATE INDEX constructionline_geoidx ON qwat_od.construction_line USING GIST ( geometry );


/* constraints */
ALTER TABLE qwat_od.construction_line ADD CONSTRAINT constructionline_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_constructionline_fk_object_reference ON qwat_od.construction_line(fk_object_reference);



