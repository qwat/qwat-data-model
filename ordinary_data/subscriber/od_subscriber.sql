/*
	qWat - QGIS Water Module

	SQL file :: subscriber table
*/

CREATE TABLE qwat_od.subscriber ();
COMMENT ON TABLE qwat_od.subscriber IS 'Table for subscriber. Inherits from node.';

ALTER TABLE qwat_od.subscriber ADD COLUMN id                 integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.subscriber ADD COLUMN fk_subscriber_type integer not null;
ALTER TABLE qwat_od.subscriber ADD COLUMN parcel             varchar(12)  ;
ALTER TABLE qwat_od.subscriber ADD COLUMN flow_current       decimal(8,2);
ALTER TABLE qwat_od.subscriber ADD COLUMN flow_planned       decimal(8,2);


/* CONSTRAINTS */
ALTER TABLE qwat_od.subscriber ADD CONSTRAINT subscriber_fk_type FOREIGN KEY (fk_subscriber_type) REFERENCES qwat_vl.subscriber_type (id) MATCH FULL; CREATE INDEX fki_subscriber_fk_type ON qwat_od.subscriber(fk_subscriber_type)  ;





