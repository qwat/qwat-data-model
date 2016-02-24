/*
	qWat - QGIS Water Module

	SQL file :: meter table
*/


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

ALTER TABLE qwat_od.remote ADD COLUMN geometry      geometry('MULTILINESTRING',:SRID) NOT NULL;
ALTER TABLE qwat_od.remote ADD COLUMN geometry_alt1 geometry('MULTILINESTRING',:SRID);
ALTER TABLE qwat_od.remote ADD COLUMN geometry_alt2 geometry('MULTILINESTRING',:SRID);

CREATE INDEX remote_geoidx      ON qwat_od.pipe USING GIST ( geometry );
CREATE INDEX remote_geoidx_alt1 ON qwat_od.pipe USING GIST ( geometry_alt1 );
CREATE INDEX remote_geoidx_alt2 ON qwat_od.pipe USING GIST ( geometry_alt2 );


/* LABELS */
SELECT qwat_sys.fn_label_create_fields('remote');

/* CONSTRAINTS */
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_distributor  FOREIGN KEY (fk_distributor)  REFERENCES qwat_od.distributor(id)      MATCH FULL; CREATE INDEX fki_remote_fk_distributor   ON qwat_od.remote(fk_distributor) ;
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_status       FOREIGN KEY (fk_status)       REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_remote_fk_status        ON qwat_od.remote(fk_status)      ;
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_precision    FOREIGN KEY (fk_precision)    REFERENCES qwat_vl.precision(id)        MATCH FULL; CREATE INDEX fki_remote_fk_precision     ON qwat_od.remote(fk_precision);
ALTER TABLE qwat_od.remote ADD CONSTRAINT remote_fk_material     FOREIGN KEY (fk_material)     REFERENCES qwat_vl.pipe_material(id)    MATCH FULL; CREATE INDEX fki_remote_fk_material      ON qwat_od.remote(fk_material);


/* --------------------------------------------*/
/* -------- ALTERNATIVE GEOM TRIGGER ----------*/

CREATE TRIGGER tr_remote_altgeom_insert
	BEFORE INSERT ON qwat_od.remote
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_remote_altgeom_insert ON qwat_od.remote IS 'Trigger: handle alternative geometries on insert';

CREATE TRIGGER tr_remote_altgeom_update
	BEFORE UPDATE OF geometry ON qwat_od.remote
	FOR EACH ROW
	WHEN  ( ST_Equals(ST_Force2d(NEW.geometry), ST_Force2d(OLD.geometry)) IS FALSE )
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_main();
COMMENT ON TRIGGER tr_remote_altgeom_update ON qwat_od.remote IS 'Trigger: handle alternative geometries on update';

CREATE TRIGGER tr_remote_altgeom_alt
	BEFORE UPDATE OF geometry_alt1, geometry_alt2 ON qwat_od.remote
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_od.ft_geometry_alternative_aux();
COMMENT ON TRIGGER tr_remote_altgeom_alt ON qwat_od.remote IS 'Trigger: when updating, check if alternative geometries are different to fill the boolean fields.';

