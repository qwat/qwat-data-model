/*
	qWat - QGIS Water Module

	SQL file :: subscriber reference
*/

CREATE TABLE qwat_od.subscriber_reference (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.subscriber_reference IS 'Table for subscriber references. These are used to place references to subscribers if they rely far away from their pipe (i.e. on another printed map). Hence, the reference is printed on the same map than the pipe.';

ALTER TABLE qwat_od.subscriber_reference ADD COLUMN fk_subscriber integer ;

/* GEOMETRY */
ALTER TABLE qwat_od.subscriber_reference ADD COLUMN geometry geometry('POINT',:SRID);
CREATE INDEX subscriber_reference_geoidx_sch ON qwat_od.subscriber_reference USING GIST ( geometry );
			
/* CONSTRAINTS */
ALTER TABLE qwat_od.subscriber_reference ADD CONSTRAINT subscriber_reference_fk_subscriber FOREIGN KEY (fk_subscriber) REFERENCES qwat_od.subscriber (id) MATCH FULL; CREATE INDEX fki_subscriber_reference_fk_subscriber ON qwat_od.subscriber_reference(fk_subscriber);

