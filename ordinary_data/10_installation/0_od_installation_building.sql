/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.installation_building CASCADE;
CREATE TABLE qwat_od.installation_building (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.installation_building IS 'This table is used to define the buildings of installation.';

/* columns */
ALTER TABLE qwat_od.installation_building ADD COLUMN name            varchar(60) default '';
ALTER TABLE qwat_od.installation_building ADD COLUMN identification  varchar(25) default '';
ALTER TABLE qwat_od.installation_building ADD COLUMN id_type         integer not null;
ALTER TABLE qwat_od.installation_building ADD COLUMN _displayname_en varchar(50) default '';
ALTER TABLE qwat_od.installation_building ADD COLUMN _displayname_fr varchar(50) default '';
ALTER TABLE qwat_od.installation_building ADD COLUMN schema_visible  boolean not null default true ;
ALTER TABLE qwat_od.installation_building ADD COLUMN year            smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_building ADD COLUMN parcel          varchar(30) default '';
ALTER TABLE qwat_od.installation_building ADD COLUMN eca             varchar(30) default '';

/* geometry */
/* point                              ( table_name,       is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_building',true,    true,        true,             false ,    true         , false);
/* polygon */
SELECT AddGeometryColumn('qwat_od', 'installation_building', 'geometry_polygon', 21781, 'MULTIPOLYGON', 2);
CREATE INDEX installation_building_poly_geoidx ON qwat_od.installation_building USING GIST ( geometry_polygon ); 

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_building');

/* Constraints */
ALTER TABLE qwat_od.installation_building ADD CONSTRAINT installation_id_type          FOREIGN KEY (id_type)          REFERENCES qwat_vl.installation_type(id) MATCH FULL;  CREATE INDEX fki_installation_id_type          ON qwat_od.installation_building(id_type)          ;

/* TRIGGERS */
CREATE OR REPLACE FUNCTION qwat_od.ft_installation_building() RETURNS trigger AS
$BODY$
BEGIN
	 NEW._displayname_en = installation_type.short_en||' '||NEW.name FROM qwat_vl.installation_type WHERE NEW.id_type = installation_type.id;
	 NEW._displayname_fr = installation_type.short_fr||' '||NEW.name FROM qwat_vl.installation_type WHERE NEW.id_type = installation_type.id;
	 RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_installation_building
        BEFORE INSERT OR UPDATE OF id_type, name ON qwat_od.installation_building 
        FOR EACH ROW
        EXECUTE PROCEDURE qwat_od.ft_installation_building();
