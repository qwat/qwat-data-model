/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/

CREATE TABLE qwat_od.part (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.part IS 'Table for installation parts.';

/* COLUMNS */

ALTER TABLE qwat_od.part ADD COLUMN fk_type          integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN identification   varchar(15)  ;
ALTER TABLE qwat_od.part ADD COLUMN fk_distributor   integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN fk_status        integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN fk_precision     integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN fk_precisionalti integer not null ;
ALTER TABLE qwat_od.part ADD COLUMN year smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.part ADD COLUMN altitude_real    decimal(10,3)    ;
ALTER TABLE qwat_od.part ADD COLUMN fk_altitude_reference integer     ;
ALTER TABLE qwat_od.part ADD COLUMN orientation      smallint         ;
ALTER TABLE qwat_od.part ADD COLUMN remark           text   ;

/* GEOMETRY                    (table_name, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('part',   true,    false,        true,             true,       true,         true);

/* LABELS */
SELECT qwat_od.fn_label_create_fields('part');

/* CONSTRAINTS */
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_type               FOREIGN KEY (fk_type)               REFERENCES qwat_vl.part_type(id)          MATCH FULL; CREATE INDEX fki_part_fk_type               ON qwat_od.part(fk_type) ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_distributor        FOREIGN KEY (fk_distributor)        REFERENCES qwat_od.distributor(id)        MATCH FULL; CREATE INDEX fki_part_fk_distributor        ON qwat_od.part(fk_distributor) ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_status             FOREIGN KEY (fk_status)             REFERENCES qwat_vl.status(id)             MATCH FULL; CREATE INDEX fki_part_fk_status             ON qwat_od.part(fk_status)      ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_altitude_reference FOREIGN KEY (fk_altitude_reference) REFERENCES qwat_vl.altitude_reference(id) MATCH FULL; CREATE INDEX fki_part_fk_altitude_reference ON qwat_od.part(fk_altitude_reference);
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_precision          FOREIGN KEY (fk_precision)          REFERENCES qwat_vl.precision(id)          MATCH FULL; CREATE INDEX fki_part_fk_precision          ON qwat_od.part(fk_precision)    ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_fk_precisionalti      FOREIGN KEY (fk_precisionalti)      REFERENCES qwat_vl.precisionalti(id)      MATCH FULL; CREATE INDEX fki_part_fk_precisionalti      ON qwat_od.part(fk_precisionalti);


