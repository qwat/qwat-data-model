/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/

CREATE TABLE qwat_od.meter ();
COMMENT ON TABLE qwat_od.meter IS 'Table for meters. Inherits from node.';



/* COLUMNS */
ALTER TABLE qwat_od.meter ADD COLUMN id integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;

ALTER TABLE qwat_od.meter ADD COLUMN parcel varchar(12)  ;






