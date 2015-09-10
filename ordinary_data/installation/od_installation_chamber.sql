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

/* EDITABE VIEW */
SELECT qwat_sys.fn_installation_view_create('installation_chamber', ARRAY['fk_object_reference','networkseparation','meter','depth','no_valves']);

/* EXPORT VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_chamber_fr AS
SELECT
	installation_chamber.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype
	FROM qwat_od.installation_chamber
	INNER JOIN      qwat_vl.status          ON status.id          = installation_chamber.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id     = installation_chamber.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id     = installation_chamber.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id       = installation_chamber.fk_watertype;
