/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/

CREATE TABLE qwat_od.element ();
COMMENT ON TABLE qwat_od.element IS 'Table for installation elements. Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.element ADD COLUMN id integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.element ADD COLUMN fk_element_type integer not null ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.element ADD CONSTRAINT element_fk_type FOREIGN KEY (fk_element_type) REFERENCES qwat_vl.element_type(id) MATCH FULL; CREATE INDEX fki_element_fk_type ON qwat_od.element(fk_element_type) ;



