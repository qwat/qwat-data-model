/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.printmap (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.printmap IS 'This table is used for polygons for predefined printable maps. shortname would be used as label string, and long_mame would be used in the print composer.';

/* columns */
ALTER TABLE qwat_od.printmap ADD COLUMN name         varchar(20) ;
ALTER TABLE qwat_od.printmap ADD COLUMN fk_district  smallint;
ALTER TABLE qwat_od.printmap ADD COLUMN remark       text ;
ALTER TABLE qwat_od.printmap ADD COLUMN version_date date;

ALTER TABLE qwat_od.printmap ADD COLUMN x_min double precision;
ALTER TABLE qwat_od.printmap ADD COLUMN y_min double precision;
ALTER TABLE qwat_od.printmap ADD COLUMN x_max double precision;
ALTER TABLE qwat_od.printmap ADD COLUMN y_max double precision;

/* geometry */
ALTER TABLE qwat_od.printmap ADD COLUMN geometry geometry('POLYGON',:SRID);
CREATE INDEX printmap_geoidx ON qwat_od.printmap USING GIST ( geometry ); 

/* LABELS */
SELECT qwat_sys.fn_label_create_fields('printmap');

/* Constraints */
ALTER TABLE qwat_od.printmap ADD CONSTRAINT printmap_fk_district FOREIGN KEY (fk_district) REFERENCES qwat_od.district (id) MATCH FULL ; CREATE INDEX fki_printmap_fk_district ON qwat_od.printmap(id);
