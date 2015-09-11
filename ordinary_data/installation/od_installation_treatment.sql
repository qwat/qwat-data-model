/*
	qWat - QGIS Water Module
	
	SQL file :: installation treatment
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_treatment ();

/* specific to treatment */
ALTER TABLE qwat_od.installation_treatment ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN sanitization_uv               boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN sanitization_chlorine_liquid  boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN sanitization_chlorine_gazeous boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN sanitization_ozone            boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN filtration_membrane           boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN filtration_sandorgravel       boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN flocculation                  boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN activatedcharcoal             boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN settling                      boolean      ;
ALTER TABLE qwat_od.installation_treatment ADD COLUMN treatment_capacity            decimal(10,2);


/* EDITABE VIEW */
SELECT qwat_sys.fn_installation_view_create('installation_treatment', ARRAY['sanitization_uv','sanitization_chlorine_liquid','sanitization_chlorine_gazeous','sanitization_ozone','filtration_membrane','filtration_sandorgravel','flocculation','activatedcharcoal','settling','treatment_capacity']);

/* EXPORT VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_treatment_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype
	FROM qwat_od.vw_edit_installation_treatment i
	INNER JOIN      qwat_vl.status          ON status.id          = i.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id     = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id     = i.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id       = i.fk_watertype
	-- specific
	;
