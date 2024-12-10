ALTER TABLE qwat_od.sia405pt_protection_tube ADD COLUMN fk_folder        integer ;
ALTER TABLE qwat_od.sia405pt_protection_tube ADD CONSTRAINT sia405pt_protection_tube_fk_folder         FOREIGN KEY (fk_folder)         REFERENCES qwat_od.folder(id)             MATCH FULL; CREATE INDEX fki_sia405pt_protection_tube_fk_folder        ON qwat_od.sia405pt_protection_tube(fk_folder);
