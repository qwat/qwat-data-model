ALTER TABLE qwat_od.hydrant ALTER COLUMN fk_model_sup DROP NOT NULL;
ALTER table qwat_od.hydrant ADD CONSTRAINT above_ground_hydrant_has_2_parts_check check (
(fk_model_sup IS NOT NULL OR underground IS TRUE) -- If the hydrant is above ground fk_model_sup should be filled
);
