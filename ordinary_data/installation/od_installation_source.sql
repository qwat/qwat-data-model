/*
	qWat - QGIS Water Module

	SQL file :: installation source
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_source ();

/* specific to sources */
ALTER TABLE qwat_od.installation_source ADD COLUMN id NOT NULL REFERENCES qwat_od.installation(id) PRIMARY KEY ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_type           smallint     ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_quality        smallint     ;
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_lowest       decimal(10,3);
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_mean         decimal(10,3);
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_concession   decimal(10,2);
ALTER TABLE qwat_od.installation_source ADD COLUMN contract_end      date         ;
ALTER TABLE qwat_od.installation_source ADD COLUMN gathering_chamber boolean      ;

/* Constraints */
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_type         FOREIGN KEY (fk_type)         REFERENCES qwat_vl.source_type(id)           MATCH FULL;   CREATE INDEX fki_installation_source_source_type    ON qwat_od.installation_source(fk_type)        ;
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_quality      FOREIGN KEY (fk_quality)      REFERENCES qwat_vl.source_quality(id)        MATCH FULL; CREATE INDEX fki_installation_source_source_quality ON qwat_od.installation_source(fk_quality)     ;


/* VIEW */
CREATE OR REPLACE VIEW qwat_od.vw_installation_source_fr AS
SELECT
	installation_source.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	source_type.value_fr AS type,
	source_quality.value_fr AS quality
	FROM qwat_od.installation_source
	INNER JOIN      qwat_vl.status         ON status.id         = installation_source.fk_status
	INNER JOIN      qwat_od.distributor    ON distributor.id    = installation_source.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type    ON remote_type.id   = installation_source.fk_remote
	INNER JOIN      qwat_vl.watertype      ON watertype.id      = installation_source.fk_watertype
	LEFT OUTER JOIN qwat_vl.source_type    ON source_type.id    = installation_source.fk_type
	LEFT OUTER JOIN qwat_vl.source_quality ON source_quality.id = installation_source.fk_quality;

