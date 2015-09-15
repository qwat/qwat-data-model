	/*
	qWat - QGIS Water Module

	SQL file :: installation chamber
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_chamber();

/* specific to chambers */
ALTER TABLE qwat_od.installation_chamber ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_object_reference integer not null;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN networkseparation   boolean         ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN meter               boolean         ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN depth 	            decimal(10,3)   ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN no_valves 	        smallint        ;

/* Constraints */
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_installation_chamber_fk_object_reference ON qwat_od.installation_chamber(fk_object_reference);


