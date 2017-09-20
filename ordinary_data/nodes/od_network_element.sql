/*
	qWat - QGIS Water Module

	SQL file :: network network_element
*/



CREATE TABLE qwat_od.network_element ();

COMMENT ON TABLE qwat_od.network_element IS 'Tables for network network_elements.
Every network_element of the network (hydrants, network_element, installations, etc.) inherit from network_element which itself inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.network_element ADD COLUMN id                  integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.network_element ADD COLUMN identification      varchar(50);
ALTER TABLE qwat_od.network_element ADD COLUMN fk_distributor      integer not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_status           integer not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_folder           integer;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_locationtype     integer[];
ALTER TABLE qwat_od.network_element ADD COLUMN fk_precision        integer not null;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_precisionalti    integer;
ALTER TABLE qwat_od.network_element ADD COLUMN fk_object_reference integer;
ALTER TABLE qwat_od.network_element ADD COLUMN altitude            decimal(10,3) default null;
ALTER TABLE qwat_od.network_element ADD COLUMN year                smallint CHECK (year     IS NULL OR year     > 1800 AND year     < 2100);
ALTER TABLE qwat_od.network_element ADD COLUMN year_end            smallint CHECK (year_end IS NULL OR year_end > 1800 AND year_end < 2100);
ALTER TABLE qwat_od.network_element ADD COLUMN orientation         float default null; COMMENT ON COLUMN qwat_od.network_element.orientation IS 'orientation field aims at overwrtiting qwat_od.node._pipe_orientation which is automatically calculated from the pipes. In the editable views, orientation will be COALESCE(netwrok_element.orientation, node._pipe_orientation). Update will be forwarded to network_element.';
ALTER TABLE qwat_od.network_element ADD COLUMN remark              text;

/* LABELS */
DO $$ BEGIN PERFORM qwat_sys.fn_label_create_fields('network_element'); END $$;


/* CONSTRAINTS */
ALTER TABLE qwat_od.network_element ADD CONSTRAINT element_fk_distributor      FOREIGN KEY (fk_distributor)      REFERENCES qwat_od.distributor(id)      MATCH FULL; CREATE INDEX fki_element_fk_distributor      ON qwat_od.network_element(fk_distributor);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT element_fk_status           FOREIGN KEY (fk_status)           REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_element_fk_status           ON qwat_od.network_element(fk_status);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT element_fk_folder           FOREIGN KEY (fk_folder)           REFERENCES qwat_od.folder(id)           MATCH FULL; CREATE INDEX fki_element_fk_folder           ON qwat_od.network_element(fk_folder);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT element_fk_precision        FOREIGN KEY (fk_precision)        REFERENCES qwat_vl.precision(id)        MATCH FULL; CREATE INDEX fki_element_fk_precision        ON qwat_od.network_element(fk_precision);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT element_fk_precisionalti    FOREIGN KEY (fk_precisionalti)    REFERENCES qwat_vl.precisionalti(id)    MATCH FULL; CREATE INDEX fki_element_fk_precisionalti    ON qwat_od.network_element(fk_precisionalti);
ALTER TABLE qwat_od.network_element ADD CONSTRAINT element_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_element_fk_object_reference ON qwat_od.network_element(fk_object_reference);

/* altitude - fk_object_reference, fk_altitude_precision constraints */
ALTER TABLE qwat_od.network_element ADD CONSTRAINT chk_element_altitude_obj_ref CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL );
ALTER TABLE qwat_od.network_element ADD CONSTRAINT chk_element_altitude_precisionalti CHECK (fk_precisionalti IS NOT NULL OR altitude IS NULL );
