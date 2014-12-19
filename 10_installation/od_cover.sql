/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat.od_cover CASCADE;
CREATE TABLE qwat.od_cover (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_cover IS 'Table for installation covers.';

/* COLUMNS */

ALTER TABLE qwat.od_cover ADD COLUMN id_type int;
ALTER TABLE qwat.od_cover ADD COLUMN identification  varchar(15) default ''  ;
ALTER TABLE qwat.od_cover ADD COLUMN id_distributor  integer                 ;
ALTER TABLE qwat.od_cover ADD COLUMN id_status       integer                 ;
ALTER TABLE qwat.od_cover ADD COLUMN year smallint   CHECK (year > 1800 AND year < 2100);
ALTER TABLE qwat.od_cover ADD COLUMN circular        boolean default true;
ALTER TABLE qwat.od_cover ADD COLUMN diameter        decimal(10,3);
ALTER TABLE qwat.od_cover ADD COLUMN altitude_real   decimal(10,3)           ;
ALTER TABLE qwat.od_cover ADD COLUMN remark text default '';
ALTER TABLE qwat.od_cover ADD COLUMN label_visible_1 smallint default 1;
ALTER TABLE qwat.od_cover ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat.od_cover ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat.od_cover ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat.od_cover ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat.od_cover ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat.od_cover ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat.od_cover ADD COLUMN label_r_2       double precision default null;

/* GEOMETRY                   (table_name,           is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat.fn_geom_tool_point('od_cover', true,    true,        true,            true,       true,         true);

/* CONSTRAINTS */
ALTER TABLE qwat.od_cover ADD CONSTRAINT cover_id_type        FOREIGN KEY (id_type)          REFERENCES qwat.vl_cover_type(id)         MATCH FULL; CREATE INDEX fki_cover_id_type         ON qwat.od_cover(id_type) ;
ALTER TABLE qwat.od_cover ADD CONSTRAINT cover_id_type         FOREIGN KEY (id_type)         REFERENCES qwat.vl_cover_type(id)        MATCH FULL; CREATE INDEX fki_cover_id_type          ON qwat.od_cover(id_type) ;
ALTER TABLE qwat.od_cover ADD CONSTRAINT cover_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat.od_distributor(id)      MATCH FULL; CREATE INDEX fki_cover_id_distributor   ON qwat.od_cover(id_distributor) ;
ALTER TABLE qwat.od_cover ADD CONSTRAINT cover_id_status       FOREIGN KEY (id_status)       REFERENCES qwat.vl_status(id)           MATCH FULL; CREATE INDEX fki_cover_id_status        ON qwat.od_cover(id_status)      ;
ALTER TABLE qwat.od_cover ADD CONSTRAINT cover_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL; CREATE INDEX fki_cover_label_visible_1  ON qwat.od_cover(label_visible_1);
ALTER TABLE qwat.od_cover ADD CONSTRAINT cover_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL; CREATE INDEX fki_cover_label_visible_2  ON qwat.od_cover(label_visible_2);
