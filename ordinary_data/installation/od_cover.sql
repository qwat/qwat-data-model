/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


CREATE TABLE qwat_od.cover (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.cover IS 'Table for installation covers.';

/* COLUMNS */

ALTER TABLE qwat_od.cover ADD COLUMN fk_type int;
ALTER TABLE qwat_od.cover ADD COLUMN identification  varchar(15)             ;
ALTER TABLE qwat_od.cover ADD COLUMN fk_distributor  integer                 ;
ALTER TABLE qwat_od.cover ADD COLUMN fk_status       integer                 ;
ALTER TABLE qwat_od.cover ADD COLUMN year smallint   CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.cover ADD COLUMN circular        boolean default true    ;
ALTER TABLE qwat_od.cover ADD COLUMN diameter        decimal(10,3)           ;
ALTER TABLE qwat_od.cover ADD COLUMN altitude        decimal(10,3)           ;
ALTER TABLE qwat_od.cover ADD COLUMN remark          text                    ;


/* GEOMETRY                   (table_name,           srid, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('cover', :SRID, true,    true,        true,            true,       true,         true);

/* LABELS */
SELECT qwat_od.fn_label_create_fields('cover');

/* CONSTRAINTS */
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_type        FOREIGN KEY (fk_type)        REFERENCES qwat_vl.cover_type(id)  MATCH FULL; CREATE INDEX fki_cover_fk_type        ON qwat_od.cover(fk_type) ;
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_distributor FOREIGN KEY (fk_distributor) REFERENCES qwat_od.distributor(id) MATCH FULL; CREATE INDEX fki_cover_fk_distributor ON qwat_od.cover(fk_distributor) ;
ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_status      FOREIGN KEY (fk_status)      REFERENCES qwat_vl.status(id)      MATCH FULL; CREATE INDEX fki_cover_fk_status      ON qwat_od.cover(fk_status)      ;
