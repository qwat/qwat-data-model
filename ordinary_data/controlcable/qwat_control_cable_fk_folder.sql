ALTER TABLE qwat_od.sia405cc_cable ADD COLUMN fk_folder        integer ;
ALTER TABLE qwat_od.sia405cc_cable ADD CONSTRAINT sia405cc_cable_fk_folder         FOREIGN KEY (fk_folder)         REFERENCES qwat_od.folder(id)             MATCH FULL; CREATE INDEX fki_sia405cc_cable_fk_folder        ON qwat_od.sia405cc_cable(fk_folder);

ALTER TABLE qwat_od.sia405cc_cable_point ADD COLUMN fk_folder        integer ;
ALTER TABLE qwat_od.sia405cc_cable_point ADD CONSTRAINT sia405cc_cable_point_fk_folder         FOREIGN KEY (fk_folder)         REFERENCES qwat_od.folder(id)             MATCH FULL; CREATE INDEX fki_sia405cc_cable_point_fk_folder        ON qwat_od.sia405cc_cable_point(fk_folder);