ALTER TABLE qwat_od.hydrant ALTER COLUMN fk_model_sup DROP NOT NULL;
ALTER table qwat_od.hydrant ADD CONSTRAINT above_ground_hydrant_has_2_parts_check check (
(fk_model_sup IS NOT NULL OR underground IS TRUE) -- If the hydrant is above ground fk_model_sup should be filled
);

COMMENT ON COLUMN qwat_od.hydrant.fk_model_sup
    IS 'Above ground part model (for above ground hydrants). For the underground hydrant it should not exist.';

COMMENT ON COLUMN qwat_od.hydrant.fk_model_inf
    IS 'Underground part model (for above ground hydrants). For the underground hydrant it represents the actual hydrant model.';

COMMENT ON CONSTRAINT above_ground_hydrant_has_2_parts_check ON qwat_od.hydrant
    IS 'Checks that the models for the above and underground parts of the above the ground hydrant are both filled.';
