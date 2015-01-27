/*
 qWat - QGIS Water Module
 
 SQL file :: pipe table
*/

/* create */
DROP TABLE IF EXISTS qwat_od.pipe CASCADE;
CREATE TABLE qwat_od.pipe (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.pipe IS 'Table for pipe. This should not be used for editing/viewing, as a more complete view (pipe_view) exists.';


/* columns */                                                                          
ALTER TABLE qwat_od.pipe ADD COLUMN id_parent              integer;                                      /* id_parent            FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_function            integer not null;                             /* id_function          FK */ 
ALTER TABLE qwat_od.pipe ADD COLUMN id_installmethod       integer not null;                             /* id_installmethod     FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_material            integer not null;                             /* id_material          FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_distributor         integer not null;                             /* id_distributor       FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_precision           integer not null;                             /* id_precision         FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_bedding             integer not null;                             /* id_bedding           FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_protection          integer;                                      /* id_protection        FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_status              integer not null;                             /* id_status            FK */
ALTER TABLE qwat_od.pipe ADD COLUMN id_watertype           integer not null;                             /* id_watertype         FK */
ALTER TABLE qwat_od.pipe ADD COLUMN year                   smallint CHECK (year IS NULL OR year > 1800 AND year < 2100); /* year  */
ALTER TABLE qwat_od.pipe ADD COLUMN tunnel_or_bridge       boolean default false;                        /* tunnel_or_bridge        */
ALTER TABLE qwat_od.pipe ADD COLUMN pressure_nominal       smallint default 16;                          /* pressure_nominale       */
ALTER TABLE qwat_od.pipe ADD COLUMN folder                 varchar(20) default '';                       /* folder                  */
ALTER TABLE qwat_od.pipe ADD COLUMN remark                 text        default '' ;                      /* remark                  */
ALTER TABLE qwat_od.pipe ADD COLUMN _valve_count           smallint default NULL;                        /* _valve_count            */
ALTER TABLE qwat_od.pipe ADD COLUMN _valve_closed          boolean default NULL;                         /* _valve_closed           */

/* schema view */
SELECT qwat_od.fn_enable_schemaview( 'pipe', 'pipe_function', 'id_function' );

/* LABELS */
SELECT qwat_od.fn_label_create_fields('pipe', false, false);

/* Constraints */
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_parent         FOREIGN KEY (id_parent)         REFERENCES qwat_od.pipe (id)              MATCH SIMPLE ; CREATE INDEX fki_pipe_id_parent        ON qwat_od.pipe(id_parent);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_function       FOREIGN KEY (id_function)       REFERENCES qwat_vl.pipe_function(id)      MATCH FULL   ; CREATE INDEX fki_pipe_id_function      ON qwat_od.pipe(id_function);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_installmethod  FOREIGN KEY (id_installmethod)  REFERENCES qwat_vl.pipe_installmethod(id) MATCH FULL   ; CREATE INDEX fki_pipe_id_installmethod ON qwat_od.pipe(id_installmethod);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_material       FOREIGN KEY (id_material)       REFERENCES qwat_vl.pipe_material(id)      MATCH FULL   ; CREATE INDEX fki_pipe_id_material      ON qwat_od.pipe(id_material);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_distributor    FOREIGN KEY (id_distributor)    REFERENCES qwat_od.distributor(id)        MATCH FULL   ; CREATE INDEX fki_pipe_id_distributor   ON qwat_od.pipe(id_distributor);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_precision      FOREIGN KEY (id_precision)      REFERENCES qwat_vl.precision(id)          MATCH FULL   ; CREATE INDEX fki_pipe_id_precision     ON qwat_od.pipe(id_precision);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_bedding        FOREIGN KEY (id_bedding)        REFERENCES qwat_vl.bedding(id)            MATCH SIMPLE ; CREATE INDEX fki_pipe_id_bedding       ON qwat_od.pipe(id_bedding);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_protection     FOREIGN KEY (id_protection)     REFERENCES qwat_vl.pipe_protection(id)    MATCH SIMPLE ; CREATE INDEX fki_pipe_id_protection    ON qwat_od.pipe(id_protection);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_status         FOREIGN KEY (id_status)         REFERENCES qwat_vl.status(id)             MATCH FULL   ; CREATE INDEX fki_pipe_id_status        ON qwat_od.pipe(id_status);
ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_id_watertype      FOREIGN KEY (id_watertype)      REFERENCES qwat_vl.watertype(id)          MATCH FULL   ; CREATE INDEX fki_pipe_id_watertype     ON qwat_od.pipe(id_watertype);

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








