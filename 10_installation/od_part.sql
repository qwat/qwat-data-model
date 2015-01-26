/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat_od.part CASCADE;
CREATE TABLE qwat_od.part (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.part IS 'Table for installation parts.';

/* COLUMNS */

ALTER TABLE qwat_od.part ADD COLUMN id_type int;
ALTER TABLE qwat_od.part ADD COLUMN identification  varchar(15) default ''  ;
ALTER TABLE qwat_od.part ADD COLUMN id_distributor  integer                 ;
ALTER TABLE qwat_od.part ADD COLUMN id_status       integer                 ;
ALTER TABLE qwat_od.part ADD COLUMN year smallint   CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.part ADD COLUMN altitude_real   decimal(10,3)           ;
ALTER TABLE qwat_od.part ADD COLUMN remark text default '';
ALTER TABLE qwat_od.part ADD COLUMN label_visible_1 smallint default 1;
ALTER TABLE qwat_od.part ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat_od.part ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat_od.part ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat_od.part ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat_od.part ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat_od.part ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat_od.part ADD COLUMN label_r_2       double precision default null;

/* GEOMETRY                   (table_name,           is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('part', true,    true,        true,            true,       true,         true);

/* CONSTRAINTS */
ALTER TABLE qwat_od.part ADD CONSTRAINT part_id_type         FOREIGN KEY (id_type)         REFERENCES qwat_vl.part_type(id)        MATCH FULL; CREATE INDEX fki_part_id_type          ON qwat_od.part(id_type) ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat_od.distributor(id)      MATCH FULL; CREATE INDEX fki_part_id_distributor   ON qwat_od.part(id_distributor) ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_id_status       FOREIGN KEY (id_status)       REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_part_id_status        ON qwat_od.part(id_status)      ;
ALTER TABLE qwat_od.part ADD CONSTRAINT part_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL; CREATE INDEX fki_part_label_visible_1  ON qwat_od.part(label_visible_1);
ALTER TABLE qwat_od.part ADD CONSTRAINT part_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL; CREATE INDEX fki_part_label_visible_2  ON qwat_od.part(label_visible_2);


/* add this to the node table */
INSERT INTO qwat_od.node_table (table_name,node_type,overwrite) VALUES ('part','part',false);

