/*
	qWat - QGIS Water Module

	SQL file :: installation source
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.installation_source CASCADE;
CREATE TABLE qwat_od.installation_source (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.installation_source IS '';

/* common columns to all installations*/
ALTER TABLE qwat_od.installation_source ADD COLUMN name               varchar(40)  ;
ALTER TABLE qwat_od.installation_source ADD COLUMN identification     varchar(25)  ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_installation    integer                ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_status          integer not null       ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_distributor     integer not null       ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_remote          integer                ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_watertype       integer not null       ;
ALTER TABLE qwat_od.installation_source ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat_od.installation_source ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat_od.installation_source ADD COLUMN remark             text  ;
ALTER TABLE qwat_od.installation_source ADD COLUMN year               smallint CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_source ADD COLUMN year_end           smallint CHECK (year_end IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_source ADD COLUMN open_water_surface boolean default false  ;
ALTER TABLE qwat_od.installation_source ADD COLUMN parcel             varchar(30)  ;
ALTER TABLE qwat_od.installation_source ADD COLUMN eca                varchar(30)  ;

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_source');

/* specific to sources */
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_type           smallint     ;
ALTER TABLE qwat_od.installation_source ADD COLUMN fk_quality        smallint     ;
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_lowest       decimal(10,3);
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_mean         decimal(10,3);
ALTER TABLE qwat_od.installation_source ADD COLUMN flow_concession   decimal(10,2);
ALTER TABLE qwat_od.installation_source ADD COLUMN contract_end      date         ;
ALTER TABLE qwat_od.installation_source ADD COLUMN gathering_chamber boolean      ;

/* geometry */
/*                                 (table_name,      is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_source',true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_installation FOREIGN KEY (fk_installation) REFERENCES qwat_od.installation_building(id) MATCH FULL; CREATE INDEX fki_installation_source_fk_installation   ON qwat_od.installation_source(fk_installation);
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_status       FOREIGN KEY (fk_status)       REFERENCES qwat_vl.status(id)                MATCH FULL;   CREATE INDEX fki_installation_source_fk_status         ON qwat_od.installation_source(fk_status)      ;
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_distributor  FOREIGN KEY (fk_distributor)  REFERENCES qwat_od.distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_source_fk_distributor    ON qwat_od.installation_source(fk_distributor) ;
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_remote       FOREIGN KEY (fk_remote)       REFERENCES qwat_vl.remote_type(id)           MATCH FULL; CREATE INDEX fki_installation_source_fk_remote         ON qwat_od.installation_source(fk_remote)      ;
ALTER TABLE qwat_od.installation_source ADD CONSTRAINT installation_source_fk_watertype    FOREIGN KEY (fk_watertype)    REFERENCES qwat_vl.watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_source_watertype      ON qwat_od.installation_source(fk_watertype)   ;
/* specific */
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

