

-- Missing valve constraints

-- ALTER TABLE qwat_od.valve ADD CONSTRAINT chk_valve_altitude_obj_ref CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL );
-- ALTER TABLE qwat_od.valve ADD CONSTRAINT chk_valve_altitude_precisionalti CHECK (fk_precisionalti IS NOT NULL OR altitude IS NULL );
