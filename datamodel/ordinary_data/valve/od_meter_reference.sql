/*
	qWat - QGIS Water Module

	SQL file :: subscriber reference
*/

CREATE TABLE qwat_od.meter_reference (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.meter_reference IS 'Table for meter references. These are used to place references to meters if they rely far away from their pipe (i.e. on another printed map). Hence, the reference is printed on the same map than the pipe.';

ALTER TABLE qwat_od.meter_reference ADD COLUMN fk_meter integer not null ;

/* GEOMETRY */
ALTER TABLE qwat_od.meter_reference ADD COLUMN geometry geometry('POINT',:SRID);
CREATE INDEX meter_reference_geoidx_sch ON qwat_od.meter_reference USING GIST ( geometry );
			
/* CONSTRAINTS */
ALTER TABLE qwat_od.meter_reference ADD CONSTRAINT meter_reference_fk_meter FOREIGN KEY (fk_meter) REFERENCES qwat_od.meter (id) MATCH FULL; CREATE INDEX fki_meter_reference_fk_meter ON qwat_od.meter_reference(fk_meter);

