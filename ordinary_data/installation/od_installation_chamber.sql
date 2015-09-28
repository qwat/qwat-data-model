	/*
	qWat - QGIS Water Module

	SQL file :: installation chamber
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.chamber();

/* specific to chambers */
ALTER TABLE qwat_od.chamber ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.chamber ADD COLUMN networkseparation   boolean         ;
ALTER TABLE qwat_od.chamber ADD COLUMN flow_meter               boolean    ; COMMENT ON COLUMN qwat_od.chamber.flow_meter IS 'is a flow_meter present?';
ALTER TABLE qwat_od.chamber ADD COLUMN water_meter              boolean    ; COMMENT ON COLUMN qwat_od.chamber.water_meter IS 'is a water_meter present?';
ALTER TABLE qwat_od.chamber ADD COLUMN depth 	           decimal(10,3)   ;
ALTER TABLE qwat_od.chamber ADD COLUMN no_valves 	       smallint    ;

/* Constraints */


