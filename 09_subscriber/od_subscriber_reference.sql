/*
	qWat - QGIS Water Module

	SQL file :: subscriber reference
*/


DROP TABLE IF EXISTS qwat_od.subscriber_reference CASCADE;
CREATE TABLE qwat_od.subscriber_reference (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.subscriber_reference IS 'Table for subscriber references. These are used to place references to subscribers if they rely far away from their pipe (i.e. on another printed map). Hence, the reference is printed on the same map than the pipe.';

ALTER TABLE qwat_od.subscriber_reference ADD COLUMN id_subscriber integer ;

/* GEOMETRY */
SELECT addGeometryColumn('qwat_od', 'subscriber_reference', 'geometry', 21781, 'POINT', 2);
CREATE INDEX subscriber_reference_geoidx_sch ON qwat_od.subscriber_reference USING GIST ( geometry );
			
/* CONSTRAINTS */
ALTER TABLE qwat_od.subscriber_reference ADD CONSTRAINT subscriber_reference_id_subscriber FOREIGN KEY (id_subscriber) REFERENCES qwat_od.subscriber (id) MATCH FULL; CREATE INDEX fki_subscriber_reference_id_subscriber ON qwat_od.subscriber_reference(id_subscriber);

