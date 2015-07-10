/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


DROP TABLE IF EXISTS qwat_od.remote CASCADE;
CREATE TABLE qwat_od.remote (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.remote IS 'Table for installation remotes.';

/* COLUMNS */
ALTER TABLE qwat_od.remote ADD COLUMN fk_distributor  integer                 ;
ALTER TABLE qwat_od.remote ADD COLUMN fk_status       integer                 ;
ALTER TABLE qwat_od.remote ADD COLUMN fk_precision    integer;
ALTER TABLE qwat_od.remote ADD COLUMN fk_material     integer;
ALTER TABLE qwat_od.remote ADD COLUMN identification  varchar(15)   ;
ALTER TABLE qwat_od.remote ADD COLUMN year smallint   CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.remote ADD COLUMN origin          varchar(150) ;
ALTER TABLE qwat_od.remote ADD COLUMN destination     varchar(150) ;
ALTER TABLE qwat_od.remote ADD COLUMN folder          varchar(50)  ;
ALTER TABLE qwat_od.remote ADD COLUMN plan            varchar(50) ;
ALTER TABLE qwat_od.remote ADD COLUMN remark text     ;

ALTER qwat_od.remote TABLE ADD COLUMN geometry geometry('MULTILINESTRING',:SRID);
CREATE INDEX remote_geoidx_line ON qwat_od.remote USING GIST ( geometry );

/* LABELS */
SELECT qwat_od.fn_label_create_fields('remote');

/* CONSTRAINTS */
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_distributor  FOREIGN KEY (fk_distributor)  REFERENCES qwat_od.distributor(id)      MATCH FULL; CREATE INDEX fki_remote_fk_distributor   ON qwat_od.remote(fk_distributor) ;
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_status       FOREIGN KEY (fk_status)       REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_remote_fk_status        ON qwat_od.remote(fk_status)      ;
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_precision    FOREIGN KEY (fk_precision)    REFERENCES qwat_vl.precision(id)        MATCH FULL; CREATE INDEX fki_remote_fk_precision     ON qwat_od.remote(fk_precision);
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_material     FOREIGN KEY (fk_material)     REFERENCES qwat_vl.pipe_material(id)    MATCH FULL; CREATE INDEX fki_remote_fk_material      ON qwat_od.remote(fk_material);

