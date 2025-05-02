/*
	qWat - QGIS Water Module

	SQL file :: base table for installations
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.installation ();
COMMENT ON TABLE qwat_od.installation IS 'This is the base table for all installation types.';

/* COLUMNS */
ALTER TABLE qwat_od.installation ADD COLUMN id                 integer NOT NULL REFERENCES qwat_od.network_element(id) PRIMARY KEY;
ALTER TABLE qwat_od.installation ADD COLUMN name               varchar(60)      ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_parent          integer          ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_remote          integer          ;
ALTER TABLE qwat_od.installation ADD COLUMN fk_watertype       integer not null ;
ALTER TABLE qwat_od.installation ADD COLUMN parcel             varchar(30)  ;
ALTER TABLE qwat_od.installation ADD COLUMN eca                varchar(30)  ;
ALTER TABLE qwat_od.installation ADD COLUMN open_water_surface boolean     default false  ;

/* POLYGON */
ALTER TABLE qwat_od.installation ADD COLUMN geometry_polygon geometry('MULTIPOLYGON',:SRID);
CREATE INDEX installation_poly_geoidx ON qwat_od.installation USING GIST ( geometry_polygon );


/* CONSTRAINTS AND INDEXES */
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_parent           FOREIGN KEY (fk_parent)           REFERENCES qwat_od.installation(id)     MATCH FULL; CREATE INDEX fki_installation_fk_parent           ON qwat_od.installation(fk_parent)          ;
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_remote           FOREIGN KEY (fk_remote)           REFERENCES qwat_vl.remote_type(id)      MATCH FULL; CREATE INDEX fki_installation_fk_remote           ON qwat_od.installation(fk_remote)          ;
ALTER TABLE qwat_od.installation ADD CONSTRAINT installation_fk_watertype        FOREIGN KEY (fk_watertype)        REFERENCES qwat_vl.watertype(id)        MATCH FULL; CREATE INDEX fki_installation_watertype           ON qwat_od.installation(fk_watertype)       ;


