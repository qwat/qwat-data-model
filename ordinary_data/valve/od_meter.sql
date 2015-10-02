/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/

CREATE TABLE qwat_od.meter ();
COMMENT ON TABLE qwat_od.meter IS 'Table for meters. Inherits from node.';



/* COLUMNS */
ALTER TABLE qwat_od.meter ADD COLUMN id integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;

ALTER TABLE qwat_od.meter ADD COLUMN fk_pipe integer ;
ALTER TABLE qwat_od.meter ADD COLUMN parcel  varchar(50) ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.meter ADD CONSTRAINT meter_fk_pipe FOREIGN KEY (fk_pipe) REFERENCES qwat_od.pipe(id) MATCH FULL; CREATE INDEX fki_meter_fk_pipe ON qwat_od.meter(fk_pipe) ;






