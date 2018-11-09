ALTER TABLE qwat_od.cover ADD COLUMN fk_precision integer NOT NULL DEFAULT 103; -- Sets default precision TO be determined
ALTER TABLE qwat_od.cover ALTER COLUMN fk_precision DROP DEFAULT; -- Drops the default
ALTER TABLE qwat_od.cover ADD COLUMN fk_precisionalti        integer;
ALTER TABLE qwat_od.cover ADD COLUMN fk_object_reference     integer;

ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL;
CREATE INDEX fki_cover_fk_precisionalti ON qwat_od.cover(fk_precisionalti);

ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_precision FOREIGN KEY (fk_precision) REFERENCES qwat_vl.precision(id) MATCH FULL;
CREATE INDEX fki_cover_fk_precision     ON qwat_od.cover(fk_precision);

ALTER TABLE qwat_od.cover ADD CONSTRAINT cover_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL;
CREATE INDEX fki_cover_fk_object_reference ON qwat_od.cover(fk_object_reference);

ALTER TABLE qwat_od.cover ADD CONSTRAINT chk_cover_altitude_obj_ref CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL );
ALTER TABLE qwat_od.cover ADD CONSTRAINT chk_cover_altitude_precisionalti CHECK (fk_precisionalti IS NOT NULL OR altitude IS NULL );
