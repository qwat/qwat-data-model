/*
	qWat - QGIS Water Module
	
	SQL file :: hydrant
*/



/* CREATE TABLE */
CREATE TABLE qwat_od.hydrant ();

COMMENT ON TABLE qwat_od.hydrant IS 'hydrant. Inherits from node.';

/* COLUMNS */
ALTER TABLE qwat_od.hydrant ADD COLUMN id                 integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_provider        integer               ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_model_sup       integer		;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_model_inf       integer NOT NULL      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_material        integer NOT NULL      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN fk_output          integer NOT NULL      ;
ALTER TABLE qwat_od.hydrant ADD COLUMN underground        boolean  ;
ALTER TABLE qwat_od.hydrant ADD COLUMN marked        	  boolean  ; COMMENT ON COLUMN qwat_od.hydrant.marked IS 'does it have markings pointing to it';
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_static    decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_static IS 'pression statique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN pressure_dynamic   decimal(5,2)          ; COMMENT ON COLUMN qwat_od.hydrant.pressure_dynamic IS 'pression dynamique [bar]';
ALTER TABLE qwat_od.hydrant ADD COLUMN flow               decimal(8,2)          ; COMMENT ON COLUMN qwat_od.hydrant.flow IS 'debit dynamique pour une pression dynamique de 2 bars [l/min]';
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_date   date                  ;
ALTER TABLE qwat_od.hydrant ADD COLUMN observation_source varchar(45)           ;

/* CONSTRAINTS */
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_material  FOREIGN KEY (fk_material)  REFERENCES qwat_vl.hydrant_material(id)  MATCH FULL; CREATE INDEX fki_hydrant_fk_material  ON qwat_od.hydrant(fk_material);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_model_sup FOREIGN KEY (fk_model_sup) REFERENCES qwat_vl.hydrant_model_sup(id) MATCH FULL; CREATE INDEX fki_hydrant_fk_model_sup ON qwat_od.hydrant(fk_model_sup);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_model_inf FOREIGN KEY (fk_model_inf) REFERENCES qwat_vl.hydrant_model_inf(id) MATCH FULL; CREATE INDEX fki_hydrant_fk_model_inf ON qwat_od.hydrant(fk_model_inf);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_provider  FOREIGN KEY (fk_provider)  REFERENCES qwat_vl.hydrant_provider(id)  MATCH FULL; CREATE INDEX fki_hydrant_fk_provider  ON qwat_od.hydrant(fk_provider);
ALTER TABLE qwat_od.hydrant ADD CONSTRAINT hydrant_fk_output    FOREIGN KEY (fk_output)    REFERENCES qwat_vl.hydrant_output(id)    MATCH FULL; CREATE INDEX fki_hydrant_fk_output    ON qwat_od.hydrant(fk_output);

ALTER table qwat_od.hydrant ADD CONSTRAINT above_ground_hydrant_has_2_parts_check check (
(fk_model_sup IS NOT NULL OR underground IS TRUE) -- If the hydrant is above ground fk_model_sup should be filled
);
COMMENT ON CONSTRAINT above_ground_hydrant_has_2_parts_check ON qwat_od.hydrant
    IS 'Checks that the models for the above and underground parts of the above the ground hydrant are both filled.';

/* COMMENTS */

COMMENT ON COLUMN qwat_od.hydrant.fk_model_sup
    IS 'Above ground part model (for above ground hydrants). For the underground hydrant it should not exist.';

COMMENT ON COLUMN qwat_od.hydrant.fk_model_inf
    IS 'Underground part model (for above ground hydrants). For the underground hydrant it represents the actual hydrant model.';
