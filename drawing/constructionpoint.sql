/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_dr.constructionpoint CASCADE;
CREATE TABLE qwat_dr.constructionpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_dr.constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE qwat_dr.constructionpoint ADD COLUMN remark  text default '';

/* geometry */
SELECT AddGeometryColumn('qwat_dr','constructionpoint','geometry',21781,'POINT',2);
CREATE INDEX constructionpoint_geoidx ON qwat_dr.constructionpoint USING GIST ( geometry );



