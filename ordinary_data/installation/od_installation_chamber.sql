	/*
	qWat - QGIS Water Module

	SQL file :: installation pressure control
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation_chamber (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.installation_chamber IS '';

/* common columns to all installations*/
ALTER TABLE qwat_od.installation_chamber ADD COLUMN name               varchar(40)  ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN identification     varchar(25)  ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_installation    integer                ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_status          integer not null       ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_distributor     integer not null       ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_remote          integer                ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_watertype       integer not null       ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN fk_object_reference integer not null    ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN schema_visible     boolean not null default true ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN altitude_real      decimal(10,3)          ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN altitude 	       decimal(10,3) ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN remark             text         ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN year               smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_chamber ADD COLUMN year_end           smallint    CHECK (year_end IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_chamber ADD COLUMN open_water_surface boolean     default false  ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN parcel             varchar(30)  ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN eca                varchar(30)  ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN no_valves 	       smallint     ;

COMMENT ON COLUMN qwat_od.installation_chamber.altitude IS 'Altitude having the reference specified by the fk_object_reference column unlike the altitude_real column which is always measured with reference to the sea level.';

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_chamber');

/* specific to pressurecontrol */
ALTER TABLE qwat_od.installation_chamber ADD COLUMN networkseparation  boolean               ;
ALTER TABLE qwat_od.installation_chamber ADD COLUMN meter              boolean               ;


/* geometry */
/*                                 ( table_name,            srid, is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_chamber', :SRID,true,    true,       true,             false,    true,          false);

/* Constraints */
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_installation FOREIGN KEY (fk_installation) REFERENCES qwat_od.installation_building(id) MATCH FULL; CREATE INDEX fki_installation_chamber_fk_installation ON qwat_od.installation_chamber(fk_installation);
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_status       FOREIGN KEY (fk_status)       REFERENCES qwat_vl.status(id)                MATCH FULL;   CREATE INDEX fki_installation_chamber_fk_status       ON qwat_od.installation_chamber(fk_status)      ;
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_distributor  FOREIGN KEY (fk_distributor)  REFERENCES qwat_od.distributor(id)           MATCH FULL;   CREATE INDEX fki_installation_chamber_fk_distributor  ON qwat_od.installation_chamber(fk_distributor) ;
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_remote       FOREIGN KEY (fk_remote)       REFERENCES qwat_vl.remote_type(id)           MATCH FULL; CREATE INDEX fki_installation_chamber_fk_remote       ON qwat_od.installation_chamber(fk_remote)      ;
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_watertype    FOREIGN KEY (fk_watertype)    REFERENCES qwat_vl.watertype(id)             MATCH FULL;   CREATE INDEX fki_installation_chamber_watertype    ON qwat_od.installation_chamber(fk_watertype)   ;
ALTER TABLE qwat_od.installation_chamber ADD CONSTRAINT installation_chamber_fk_object_reference FOREIGN KEY (fk_object_reference) REFERENCES qwat_vl.object_reference(id) MATCH FULL; CREATE INDEX fki_installation_chamber_fk_object_reference ON qwat_od.installation_chamber(fk_object_reference);

/* VIEW */
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
