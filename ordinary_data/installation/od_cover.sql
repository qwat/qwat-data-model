/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


CREATE TABLE qwat_od.cover ();
COMMENT ON TABLE qwat_od.cover IS 'Table for installation covers.  Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.cover ADD COLUMN id              integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;
ALTER TABLE qwat_od.cover ADD COLUMN identification  varchar(50);
ALTER TABLE qwat_od.cover ADD COLUMN fk_distributor  integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_status       integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_cover_type   integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_installation integer;
ALTER TABLE qwat_od.cover ADD COLUMN year smallint   CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.cover ADD COLUMN altitude        numeric(8,3);
ALTER TABLE qwat_od.cover ADD COLUMN circular        boolean default true;
ALTER TABLE qwat_od.cover ADD COLUMN diameter        decimal(10,3)       ;
ALTER TABLE qwat_od.cover ADD COLUMN remark          text                ;
ALTER TABLE qwat_od.cover ADD COLUMN geometry        geometry('PointZ', :SRID);

/* LABELS */
SELECT qwat_sys.fn_label_create_fields('cover');

/* CONSTRAINTS */
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_type         FOREIGN KEY (fk_cover_type)   REFERENCES qwat_vl.cover_type(id)   MATCH FULL; CREATE INDEX fki_cover_fk_type         ON qwat_od.cover(fk_cover_type)  ;
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_installation FOREIGN KEY (fk_installation) REFERENCES qwat_od.installation(id) MATCH FULL; CREATE INDEX fki_cover_fk_installation ON qwat_od.cover(fk_installation);

