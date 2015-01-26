/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.hydrant CASCADE;
CREATE TABLE qwat_od.hydrant (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.hydrant IS 'hydrant.';

/* COLUMNS */
ALTER TABLE qwat_od.hydrant ADD COLUMN identification     varchar(15) default '';
ALTER TABLE qwat_od.hydrant ADD COLUMN id_distributor     integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN id_status          integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN id_provider        integer               ;
ALTER TABLE qwat_od.hydrant ADD COLUMN id_precision       integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN id_precisionalti   integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN year               smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.hydrant ADD COLUMN model              varchar(30)           default '';
ALTER TABLE qwat_od.hydrant ADD COLUMN underground        boolean default false ;
ALTER TABLE qwat_od.hydrant ADD COLUMN altitude_real      decimal(10,3)         ;
ALTER TABLE qwat_od.hydrant ADD COLUMN marked        	  boolean default false ; COMMENT ON COLUMN qwat_od.hydrant.marked IS 'does it have markings pointing to it';
ALTER TABLE qwat_od.hydrant ADD COLUMN remark             text    default ''    ;
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_static    decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_static IS 'pression statique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_dynamic   decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_dynamic IS 'pression dynamique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN flow               decimal(8,2)          ; COMMENT ON COLUMN qwat_od.hydrant.flow IS 'debit [l/min]';
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_date   date                  ;
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_source varchar(45)           default '';
ALTER TABLE qwat_od.hydrant ADD COLUMN label_visible_1    smallint default 1;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_x_1          double precision default null;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_y_1          double precision default null;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_r_1          double precision default null;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_visible_2    smallint default 1;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_x_2          double precision default null;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_y_2          double precision default null;
ALTER TABLE qwat_od.hydrant ADD COLUMN label_r_2          double precision default null;

/* geometry                     (table_name,  is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('hydrant',   true,    true,        true,             false,    true,          true);

/* CONSTRAINTS */
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_id_distributor   FOREIGN KEY (id_distributor)   REFERENCES qwat_od.distributor(id)      MATCH FULL  ; CREATE INDEX fki_hydrant_id_distributor   ON qwat_od.hydrant(id_distributor)  ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_id_status        FOREIGN KEY (id_status)        REFERENCES qwat_vl.status(id)           MATCH FULL  ; CREATE INDEX fki_hydrant_id_status        ON qwat_od.hydrant(id_status)       ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_id_provider      FOREIGN KEY (id_provider)      REFERENCES qwat_vl.hydrant_provider(id) MATCH SIMPLE; CREATE INDEX fki_hydrant_id_provider      ON qwat_od.hydrant(id_provider)     ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_id_precision     FOREIGN KEY (id_precision)     REFERENCES qwat_vl.precision(id)        MATCH FULL  ; CREATE INDEX fki_hydrant_id_precision     ON qwat_od.hydrant(id_precision)    ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_id_precisionalti FOREIGN KEY (id_precisionalti) REFERENCES qwat_vl.precisionalti(id)    MATCH FULL  ; CREATE INDEX fki_hydrant_id_precisionalti ON qwat_od.hydrant(id_precisionalti);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_label_visible_1  FOREIGN KEY (label_visible_1)  REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL;   CREATE INDEX fki_hydrant_label_visible_1  ON qwat_od.hydrant(label_visible_1)  ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_label_visible_2  FOREIGN KEY (label_visible_2)  REFERENCES qwat_vl.visible(vl_code_int) MATCH FULL;   CREATE INDEX fki_hydrant_label_visible_2  ON qwat_od.hydrant(label_visible_2)  ;


