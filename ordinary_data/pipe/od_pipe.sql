/*
 qWat - QGIS Water Module

 SQL file :: pipe table
*/

/* create */
CREATE TABLE qwat_od.pipe (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.pipe IS 'Table for pipes.';


/* columns */
ALTER TABLE qwat_od.pipe ADD COLUMN fk_parent        integer;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_function      integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_installmethod integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_material      integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_distributor   integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_precision     integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_bedding       integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_protection    integer;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_status        integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_watertype     integer not null;
ALTER TABLE qwat_od.pipe ADD COLUMN fk_locationtype  integer[];
ALTER TABLE qwat_od.pipe ADD COLUMN fk_folder        integer ;
ALTER TABLE qwat_od.pipe ADD COLUMN year             smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.pipe ADD COLUMN year_rehabilitation smallint CHECK (year_rehabilitation IS NULL OR year_rehabilitation > 1800 AND year_rehabilitation < 2100);
ALTER TABLE qwat_od.pipe ADD COLUMN year_end         smallint CHECK (year_end IS NULL OR year_end > 1800 AND year_end < 2100);
ALTER TABLE qwat_od.pipe ADD COLUMN tunnel_or_bridge boolean default false;
ALTER TABLE qwat_od.pipe ADD COLUMN pressure_nominal smallint default 16;
ALTER TABLE qwat_od.pipe ADD COLUMN remark           text         ;
ALTER TABLE qwat_od.pipe ADD COLUMN _valve_count     smallint default NULL;
ALTER TABLE qwat_od.pipe ADD COLUMN _valve_closed    boolean default NULL;

/* schema view */
SELECT qwat_sys.fn_enable_schemaview( 'pipe' );

/* LABELS */
SELECT qwat_sys.fn_label_create_fields('pipe', false, false);

/* Constraints */
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_parent         FOREIGN KEY (fk_parent)         REFERENCES qwat_od.pipe (id)              MATCH FULL; CREATE INDEX fki_pipe_fk_parent        ON qwat_od.pipe(fk_parent);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_function       FOREIGN KEY (fk_function)       REFERENCES qwat_vl.pipe_function(id)      MATCH FULL; CREATE INDEX fki_pipe_fk_function      ON qwat_od.pipe(fk_function);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_installmethod  FOREIGN KEY (fk_installmethod)  REFERENCES qwat_vl.pipe_installmethod(id) MATCH FULL; CREATE INDEX fki_pipe_fk_installmethod ON qwat_od.pipe(fk_installmethod);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_material       FOREIGN KEY (fk_material)       REFERENCES qwat_vl.pipe_material(id)      MATCH FULL; CREATE INDEX fki_pipe_fk_material      ON qwat_od.pipe(fk_material);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_distributor    FOREIGN KEY (fk_distributor)    REFERENCES qwat_od.distributor(id)        MATCH FULL; CREATE INDEX fki_pipe_fk_distributor   ON qwat_od.pipe(fk_distributor);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_precision      FOREIGN KEY (fk_precision)      REFERENCES qwat_vl.precision(id)          MATCH FULL; CREATE INDEX fki_pipe_fk_precision     ON qwat_od.pipe(fk_precision);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_bedding        FOREIGN KEY (fk_bedding)        REFERENCES qwat_vl.bedding(id)            MATCH FULL; CREATE INDEX fki_pipe_fk_bedding       ON qwat_od.pipe(fk_bedding);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_protection     FOREIGN KEY (fk_protection)     REFERENCES qwat_vl.pipe_protection(id)    MATCH FULL; CREATE INDEX fki_pipe_fk_protection    ON qwat_od.pipe(fk_protection);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_status         FOREIGN KEY (fk_status)         REFERENCES qwat_vl.status(id)             MATCH FULL; CREATE INDEX fki_pipe_fk_status        ON qwat_od.pipe(fk_status);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_watertype      FOREIGN KEY (fk_watertype)      REFERENCES qwat_vl.watertype(id)          MATCH FULL; CREATE INDEX fki_pipe_fk_watertype     ON qwat_od.pipe(fk_watertype);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_folder         FOREIGN KEY (fk_folder)         REFERENCES qwat_od.folder(id)             MATCH FULL; CREATE INDEX fki_pipe_fk_folder        ON qwat_od.pipe(fk_folder);

/*----------------!!!---!!!----------------*/
/* Trigger for tunnel_or_bridge */
CREATE OR REPLACE FUNCTION qwat_od.ft_pipe_tunnelbridge() RETURNS trigger AS
$BODY$
 BEGIN
  NEW._length3d := NULL;
  NEW._diff_elevation := NULL;
  RETURN NEW;
 END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER tr_pipe_tunnelbridge
 BEFORE INSERT OR UPDATE OF tunnel_or_bridge ON qwat_od.pipe
 FOR EACH ROW EXECUTE PROCEDURE qwat_od.ft_pipe_tunnelbridge();
COMMENT ON TRIGGER tr_pipe_tunnelbridge ON qwat_od.pipe IS 'For tunnel and bridges, 3d length is the 2d length (i.e. pipes are considered as horinzontal).';
