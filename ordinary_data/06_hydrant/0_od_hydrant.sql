/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/



/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.hydrant CASCADE;
CREATE TABLE qwat_od.hydrant (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.hydrant IS 'hydrant.';

/* COLUMNS */
ALTER TABLE qwat_od.hydrant ADD COLUMN identification     varchar(15) ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_distributor     integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_status          integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_provider        integer               ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_material        integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_precision       integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_precisionalti   integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_locationtype    integer[]		;
ALTER TABLE qwat_od.hydrant ADD COLUMN year               smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.hydrant ADD COLUMN model              varchar(30)           ;
ALTER TABLE qwat_od.hydrant ADD COLUMN underground        boolean default false ;
ALTER TABLE qwat_od.hydrant ADD COLUMN altitude_real      decimal(10,3)         ;
ALTER TABLE qwat_od.hydrant ADD COLUMN marked        	  boolean default false ; COMMENT ON COLUMN qwat_od.hydrant.marked IS 'does it have markings pointing to it';
ALTER TABLE qwat_od.hydrant ADD COLUMN remark             text        ;
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_static    decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_static IS 'pression statique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_dynamic   decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_dynamic IS 'pression dynamique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN flow               decimal(8,2)          ; COMMENT ON COLUMN qwat_od.hydrant.flow IS 'debit [l/min]';
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_date   date                  ;
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_source varchar(45)           ;

/* geometry                     (table_name,  is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('hydrant',   true,    true,        true,             false,    true,          true);

/* labels */
SELECT qwat_od.fn_label_create_fields('hydrant');

/* CONSTRAINTS */
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_distributor   FOREIGN KEY (fk_distributor)   REFERENCES qwat_od.distributor(id)      MATCH FULL; CREATE INDEX fki_hydrant_fk_distributor   ON qwat_od.hydrant(fk_distributor)  ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_material       FOREIGN KEY (fk_material)       REFERENCES qwat_vl.hydrant_material(id)      MATCH FULL; CREATE INDEX fki_hydrant_fk_material      ON qwat_od.hydrant(fk_material);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_status        FOREIGN KEY (fk_status)        REFERENCES qwat_vl.status(id)           MATCH FULL; CREATE INDEX fki_hydrant_fk_status        ON qwat_od.hydrant(fk_status)       ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_provider      FOREIGN KEY (fk_provider)      REFERENCES qwat_vl.hydrant_provider(id) MATCH FULL; CREATE INDEX fki_hydrant_fk_provider      ON qwat_od.hydrant(fk_provider)     ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_precision     FOREIGN KEY (fk_precision)     REFERENCES qwat_vl.precision(id)        MATCH FULL; CREATE INDEX fki_hydrant_fk_precision     ON qwat_od.hydrant(fk_precision)    ;
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id)    MATCH FULL; CREATE INDEX fki_hydrant_fk_precisionalti ON qwat_od.hydrant(fk_precisionalti);
