/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/

CREATE TABLE qwat_od.part ();
COMMENT ON TABLE qwat_od.part IS 'Table for installation parts. Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.part ADD COLUMN id integer NOT NULL REFERENCES qwat_od.part(id) PRIMARY KEY;
ALTER TABLE qwat_od.part ADD COLUMN fk_part_type integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN fk_pipe integer;

/* CONSTRAINTS */
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_type FOREIGN KEY (fk_part_type) REFERENCES qwat_vl.part_type(id) MATCH FULL; CREATE INDEX fki_part_fk_type ON qwat_od.part(fk_part_type) ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_pipe FOREIGN KEY (fk_pipe)      REFERENCES qwat_od.pipe(id) MATCH FULL; CREATE INDEX fki_part_fk_pipe ON qwat_od.part(fk_pipe) ;


