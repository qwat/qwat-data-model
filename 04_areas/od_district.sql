/*
	qWat - QGIS Water Module
	
	SQL file :: district
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.district CASCADE;
CREATE TABLE qwat_od.district (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.district IS 'Districts.';

/* columns */
ALTER TABLE qwat_od.district ADD COLUMN name          varchar(40) default '';
ALTER TABLE qwat_od.district ADD COLUMN shortname     varchar(12) default '';
ALTER TABLE qwat_od.district ADD COLUMN zip           varchar(12) default '';
ALTER TABLE qwat_od.district ADD COLUMN land_registry varchar(12) default '';
ALTER TABLE qwat_od.district ADD COLUMN prefix        varchar(12) default '';
ALTER TABLE qwat_od.district ADD COLUMN colorcode     smallint default 1;

/* geometry */
SELECT AddGeometryColumn('qwat_od', 'district', 'geometry', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX district_geoidx ON qwat_od.district USING GIST ( geometry );

/* contraints */
ALTER TABLE qwat_od.district ADD CONSTRAINT district_name UNIQUE (name);

