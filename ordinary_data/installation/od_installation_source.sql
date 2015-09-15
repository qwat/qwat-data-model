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

