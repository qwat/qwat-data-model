/*
	qWat - QGIS Water Module

	SQL file :: installation source
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_source ();

/* specific to sources */
ALTER TABLE qwat_od.installation_source ADD COLUMN id integer NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_source_type    smallint     ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_quality        smallint     ;
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_lowest       decimal(10,3);
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_mean         decimal(10,3);
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_concession   decimal(10,2);
ALTER TABLE qwat_od.installation_source ADD COLUMN contract_end      date         ;
ALTER TABLE qwat_od.installation_source ADD COLUMN gathering_chamber boolean      ;

/* Constraints */
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_type    FOREIGN KEY (fk_source_type) REFERENCES qwat_vl.source_type(id)    MATCH FULL; CREATE INDEX fki_installation_source_source_type    ON qwat_od.installation_source(fk_source_type);
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_quality FOREIGN KEY (fk_quality)     REFERENCES qwat_vl.source_quality(id) MATCH FULL; CREATE INDEX fki_installation_source_source_quality ON qwat_od.installation_source(fk_quality)    ;


/* EDITABE VIEW */
SELECT qwat_sys.fn_installation_view_create('installation_source', ARRAY['fk_source_type','fk_quality','flow_lowest','flow_mean','flow_concession','contract_end','gathering_chamber']);

/* EXPORT VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_source_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	source_type.value_fr AS type,
	source_quality.value_fr AS quality
	FROM qwat_od.vw_edit_installation_source i
	INNER JOIN      qwat_vl.status         ON status.id         = i.fk_status
	INNER JOIN      qwat_od.distributor    ON distributor.id    = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type    ON remote_type.id    = i.fk_remote
	INNER JOIN      qwat_vl.watertype      ON watertype.id      = i.fk_watertype
	-- specific
	LEFT OUTER JOIN qwat_vl.source_type    ON source_type.id    = i.fk_source_type
	LEFT OUTER JOIN qwat_vl.source_quality ON source_quality.id = i.fk_quality;

