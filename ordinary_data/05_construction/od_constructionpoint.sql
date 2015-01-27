/*
	qWat - QGIS Water Module
	
	SQL file :: constructionpoint arcs
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.constructionpoint CASCADE;
CREATE TABLE qwat_od.constructionpoint (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.constructionpoint IS 'construction points are artificials points to build objects.';

/* columns */
ALTER TABLE qwat_od.constructionpoint ADD COLUMN remark  text default '';

/* geometry */
SELECT AddGeometryColumn('qwat_od','constructionpoint','geometry',21781,'POINT',2);
CREATE INDEX constructionpoint_geoidx ON qwat_od.constructionpoint USING GIST ( geometry );



