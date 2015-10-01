/*
	qWat - QGIS Water Module

	SQL file :: network network_element
*/



CREATE TABLE qwat_od.network_element ();

COMMENT ON TABLE qwat_od.network_element IS 'Tables for network network_elements.
Every network_element of the network (hydrants, valves, network_element, installations, etc.) inherit from network_element which itself inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.network_element ADD COLUMN id                  integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.network_element ADD COLUMN identification      varchar(20)  not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_distributor      integer not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_status           integer not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_folder           integer not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_object_reference integer;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_locationtype     integer[];
ALTER TABLE qwat_od.network_element ADD COLUMN year                smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.network_element ADD COLUMN year_end            smallint CHECK (year_end IS NULL OR year_end > 1800 AND year_end < 2100);
ALTER TABLE qwat_od.network_element ADD COLUMN remark              text;

/* SCHEMA VIEW */
SELECT qwat_od.fn_enable_schemaview('network_element');

/* LABELS */
SELECT qwat_od.fn_label_create_fields('network_element');


/* CONSTRAINTS */
ALTER TABLE qwat_od.network_element ADD CONSTRAINT network_element_fk_distributor      FOREIGN KEY (fk_distributor)      REFERENCES qwat_od.distributor(id)      MATCH FULL; CREATE INDEX fki_network_element_fk_distributor      ON qwat_od.network_element(fk_distributor);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT network_element_fk_status           FOREIGN KEY (fk_status)           REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_network_element_fk_status           ON qwat_od.network_element(fk_status);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT network_element_fk_folder           FOREIGN KEY (fk_folder)           REFERENCES qwat_od.folder(id)           MATCH FULL; CREATE INDEX fki_network_element_fk_folder           ON qwat_od.network_element(fk_folder);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT network_element_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_network_element_fk_object_reference ON qwat_od.network_element(fk_object_reference);





