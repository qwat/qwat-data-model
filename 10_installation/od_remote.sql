/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat.od_remote CASCADE;
CREATE TABLE qwat.od_remote (id serial PRIMARY KEY);
COMMENT ON TABLE qwat.od_remote IS 'Table for installation remotes.';

/* COLUMNS */
ALTER TABLE qwat.od_remote ADD COLUMN id_distributor  integer                 ;
ALTER TABLE qwat.od_remote ADD COLUMN id_status       integer                 ;
ALTER TABLE qwat.od_remote ADD COLUMN id_precision    integer;
ALTER TABLE qwat.od_remote ADD COLUMN id_material     integer;
ALTER TABLE qwat.od_remote ADD COLUMN identification  varchar(15) default ''  ;
ALTER TABLE qwat.od_remote ADD COLUMN year smallint   CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat.od_remote ADD COLUMN origin          varchar(150) default '';
ALTER TABLE qwat.od_remote ADD COLUMN destination     varchar(150) default '';
ALTER TABLE qwat.od_remote ADD COLUMN folder          varchar(50)  default '';
ALTER TABLE qwat.od_remote ADD COLUMN plan            varchar(50) default '';
ALTER TABLE qwat.od_remote ADD COLUMN remark text     default '';
ALTER TABLE qwat.od_remote ADD COLUMN label_visible_1 smallint default 1;
ALTER TABLE qwat.od_remote ADD COLUMN label_x_1       double precision default null;
ALTER TABLE qwat.od_remote ADD COLUMN label_y_1       double precision default null;
ALTER TABLE qwat.od_remote ADD COLUMN label_r_1       double precision default null;
ALTER TABLE qwat.od_remote ADD COLUMN label_remark_1  varchar(150) default '';
ALTER TABLE qwat.od_remote ADD COLUMN label_visible_2 smallint default 1;
ALTER TABLE qwat.od_remote ADD COLUMN label_x_2       double precision default null;
ALTER TABLE qwat.od_remote ADD COLUMN label_y_2       double precision default null;
ALTER TABLE qwat.od_remote ADD COLUMN label_r_2       double precision default null;
ALTER TABLE qwat.od_remote ADD COLUMN label_remark_2  varchar(150) default '';

SELECT AddGeometryColumn('qwat', 'od_remote', 'geometry', 21781, 'MULTILINESTRING', 2)  ;
CREATE INDEX remote_geoidx_line ON qwat.od_remote USING GIST ( geometry );

/* CONSTRAINTS */
ALTER TABLE qwat.od_remote ADD CONSTRAINT remote_id_distributor  FOREIGN KEY (id_distributor)  REFERENCES qwat.od_distributor(id)      MATCH FULL; CREATE INDEX fki_remote_id_distributor   ON qwat.od_remote(id_distributor) ;
ALTER TABLE qwat.od_remote ADD CONSTRAINT remote_id_status       FOREIGN KEY (id_status)       REFERENCES qwat.vl_status(id)           MATCH FULL; CREATE INDEX fki_remote_id_status        ON qwat.od_remote(id_status)      ;
ALTER TABLE qwat.od_remote ADD CONSTRAINT remote_id_precision    FOREIGN KEY (id_precision)    REFERENCES qwat.vl_precision(id)        MATCH FULL; CREATE INDEX fki_remote_id_precision     ON qwat.od_remote(id_precision);
ALTER TABLE qwat.od_remote ADD CONSTRAINT remote_id_material     FOREIGN KEY (id_material)     REFERENCES qwat.vl_pipe_material(id)    MATCH FULL; CREATE INDEX fki_remote_id_material      ON qwat.od_remote(id_material);
ALTER TABLE qwat.od_remote ADD CONSTRAINT remote_label_visible_1 FOREIGN KEY (label_visible_1) REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL; CREATE INDEX fki_remote_label_visible_1  ON qwat.od_remote(label_visible_1);
ALTER TABLE qwat.od_remote ADD CONSTRAINT remote_label_visible_2 FOREIGN KEY (label_visible_2) REFERENCES qwat.vl_visible(vl_code_int) MATCH FULL; CREATE INDEX fki_remote_label_visible_2  ON qwat.od_remote(label_visible_2);

