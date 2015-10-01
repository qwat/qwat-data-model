/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


CREATE TABLE qwat_od.cover ();
COMMENT ON TABLE qwat_od.cover IS 'Table for installation covers.  Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.cover ADD COLUMN id            integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;
ALTER TABLE qwat_od.cover ADD COLUMN fk_cover_type integer;
ALTER TABLE qwat_od.cover ADD COLUMN circular      boolean default true    ;
ALTER TABLE qwat_od.cover ADD COLUMN diameter      decimal(10,3)           ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_type        FOREIGN KEY (fk_cover_type)  REFERENCES qwat_vl.cover_type(id)  MATCH FULL; CREATE INDEX fki_cover_fk_type        ON qwat_od.cover(fk_cover_type) ;
