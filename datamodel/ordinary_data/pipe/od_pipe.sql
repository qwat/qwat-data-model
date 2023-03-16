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
ALTER TABLE qwat_od.pipe ADD COLUMN year             smallint;
ALTER TABLE qwat_od.pipe ADD COLUMN year_rehabilitation smallint;
ALTER TABLE qwat_od.pipe ADD COLUMN year_end         smallint;
ALTER TABLE qwat_od.pipe ADD COLUMN tunnel_or_bridge boolean default false;
ALTER TABLE qwat_od.pipe ADD COLUMN pressure_nominal smallint default 16;
ALTER TABLE qwat_od.pipe ADD COLUMN remark           text         ;
ALTER TABLE qwat_od.pipe ADD COLUMN _valve_count     smallint default NULL;
ALTER TABLE qwat_od.pipe ADD COLUMN _valve_closed    boolean default NULL;

COMMENT ON COLUMN qwat_od.pipe.year IS 'Represents the year when the pipe was installed. It can be NULL (not filled), between 1800 and the current year. If the pipe has project status then the maximum value of the year can be 50 years from the current year.';
COMMENT ON COLUMN qwat_od.pipe.year_rehabilitation IS 'Represents the year when the pipe was rehabilitated. It can be NULL (not filled) or between 1800 and the current year.';
COMMENT ON COLUMN qwat_od.pipe.year_end IS 'Represents the year when the pipe was shut down. It can be NULL (not filled) or between 1800 and the current year.';

/* schema view */
DO $$ BEGIN PERFORM qwat_sys.fn_enable_schemavisible( 'pipe', 'pipe_function', 'fk_function' ); END $$;

/* LABELS */
DO $$ BEGIN PERFORM qwat_sys.fn_label_create_fields('pipe', false, false); END $$;

/* Constraints */
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_fk_parent         FOREIGN KEY (fk_parent)         REFERENCES qwat_od.pipe (id)              MATCH FULL ON DELETE SET NULL; CREATE INDEX fki_pipe_fk_parent        ON qwat_od.pipe(fk_parent);
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

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_check CHECK (year IS NULL OR year >= 1800 AND (year <= EXTRACT(YEAR FROM NOW()) OR fk_status = 1306 AND year - 50 <= EXTRACT(YEAR FROM NOW())));
COMMENT ON CONSTRAINT pipe_year_check ON qwat_od.pipe IS 'Year when the pipe was installed should be either NULL - not filled OR between 1800 and the current year; if the pipe has the project status (fk_status = 1306) then the year can be between 1800 and 50 years from now';

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_rehabilitation_check CHECK (year_rehabilitation IS NULL OR year_rehabilitation > 1800 AND year_rehabilitation <= EXTRACT(YEAR FROM NOW()));
COMMENT ON CONSTRAINT pipe_year_rehabilitation_check ON qwat_od.pipe IS 'Pipe rehabilitation year should be between 1800 and the current year or NULL/not filled';

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_end_check CHECK (year_end IS NULL OR year_end > 1800 AND year_end <= EXTRACT(YEAR FROM NOW()));
COMMENT ON CONSTRAINT pipe_year_end_check ON qwat_od.pipe IS 'Year when the pipe was shut down should be between 1800 and the current year or NULL/not filled';

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
