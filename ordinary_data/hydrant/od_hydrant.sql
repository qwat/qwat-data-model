/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/



/* CREATE TABLE */
CREATE TABLE qwat_od.hydrant ();

COMMENT ON TABLE qwat_od.hydrant IS 'hydrant. Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.hydrant ADD COLUMN id                 integer NOT NULL REFERENCES qwat_od.node(id) PRIMARY KEY;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_provider        integer               ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_material        integer not null      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN model              varchar(30)           ;
ALTER TABLE qwat_od.hydrant ADD COLUMN underground        boolean default false ;
ALTER TABLE qwat_od.hydrant ADD COLUMN marked        	  boolean default false ; COMMENT ON COLUMN qwat_od.hydrant.marked IS 'does it have markings pointing to it';
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_static    decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_static IS 'pression statique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_dynamic   decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_dynamic IS 'pression dynamique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN flow               decimal(8,2)          ; COMMENT ON COLUMN qwat_od.hydrant.flow IS 'debit [l/min]';
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_date   date                  ;
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_source varchar(45)           ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_material      FOREIGN KEY (fk_material)      REFERENCES qwat_vl.hydrant_material(id) MATCH FULL; CREATE INDEX fki_hydrant_fk_material      ON qwat_od.hydrant(fk_material);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_provider      FOREIGN KEY (fk_provider)      REFERENCES qwat_vl.hydrant_provider(id) MATCH FULL; CREATE INDEX fki_hydrant_fk_provider      ON qwat_od.hydrant(fk_provider)     ;
