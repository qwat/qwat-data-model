/*
	qWat - QGIS Water Module
	
	SQL file :: print table and function
*/


/* CREATE TABLE */
CREATE TABLE qwat_od.installation_building (id serial PRIMARY KEY);
COMMENT ON TABLE qwat_od.installation_building IS 'This table is used to define the buildings of installation.';

/* columns */
ALTER TABLE qwat_od.installation_building ADD COLUMN name            varchar(60) ;
ALTER TABLE qwat_od.installation_building ADD COLUMN identification  varchar(25) ;
ALTER TABLE qwat_od.installation_building ADD COLUMN fk_status       integer not null      ;
ALTER TABLE qwat_od.installation_building ADD COLUMN fk_type         integer not null      ;
ALTER TABLE qwat_od.installation_building ADD COLUMN fk_locationtype integer[]		   ; 
ALTER TABLE qwat_od.installation_building ADD COLUMN _displayname_en varchar(50) ;
ALTER TABLE qwat_od.installation_building ADD COLUMN _displayname_fr varchar(50) ;
ALTER TABLE qwat_od.installation_building ADD COLUMN _displayname_ro varchar(50) ;
ALTER TABLE qwat_od.installation_building ADD COLUMN schema_visible  boolean not null default true ;
ALTER TABLE qwat_od.installation_building ADD COLUMN year            smallint    CHECK (year IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_building ADD COLUMN year_end        smallint    CHECK (year_end IS NULL OR year > 1800 AND year < 2100);
ALTER TABLE qwat_od.installation_building ADD COLUMN parcel          varchar(30) ;
ALTER TABLE qwat_od.installation_building ADD COLUMN eca             varchar(30) ;

/* geometry */
/* point                              ( table_name,       is_node, create_node, create_schematic, get_pipe, auto_district, auto_pressurezone)*/
SELECT qwat_od.fn_geom_tool_point('installation_building',true,    true,        true,             false ,    true         , false);
/* polygon */
ALTER TABLE qwat_od.installation_building ADD COLUMN geometry_polygon geometry('MULTIPOLYGON',:SRID);
CREATE INDEX installation_building_poly_geoidx ON qwat_od.installation_building USING GIST ( geometry_polygon ); 

/* LABELS */
SELECT qwat_od.fn_label_create_fields('installation_building');

/* Constraints */
ALTER TABLE qwat_od.installation_building ADD CONSTRAINT installation_fk_status FOREIGN KEY (fk_status) REFERENCES qwat_vl.status(id)            MATCH FULL; CREATE INDEX fki_installation_fk_status ON qwat_od.installation_building(fk_status);
ALTER TABLE qwat_od.installation_building ADD CONSTRAINT installation_fk_type   FOREIGN KEY (fk_type)   REFERENCES qwat_vl.installation_type(id) MATCH FULL; CREATE INDEX fki_installation_fk_type   ON qwat_od.installation_building(fk_type) ;

/* TRIGGERS */
CREATE OR REPLACE FUNCTION qwat_od.ft_installation_building() RETURNS trigger AS
$BODY$
BEGIN
	 NEW._displayname_en = installation_type.short_en||' '||NEW.name FROM qwat_vl.installation_type WHERE NEW.fk_type = installation_type.id;
	 NEW._displayname_fr = installation_type.short_fr||' '||NEW.name FROM qwat_vl.installation_type WHERE NEW.fk_type = installation_type.id;
	 NEW._displayname_ro = installation_type.short_ro||' '||NEW.name FROM qwat_vl.installation_type WHERE NEW.fk_type = installation_type.id;
	 RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_installation_building
        BEFORE INSERT OR UPDATE OF fk_type, name ON qwat_od.installation_building 
        FOR EACH ROW
        EXECUTE PROCEDURE qwat_od.ft_installation_building();
