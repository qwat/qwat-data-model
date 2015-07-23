/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

/* CREATE TABLE */
CREATE TABLE qwat_od.node (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE qwat_od.node ADD COLUMN fk_precisionalti integer                  ;
ALTER TABLE qwat_od.node ADD COLUMN altitude         decimal(10,3)            ;
ALTER TABLE qwat_od.node ADD COLUMN _type            varchar(40) default null ;
ALTER TABLE qwat_od.node ADD COLUMN _orientation     float       default 0    ;
ALTER TABLE qwat_od.node ADD COLUMN _schema_visible  boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _status_active   boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _under_object    boolean     default false;

/* geometry */
ALTER TABLE qwat_od.node ADD COLUMN geometry geometry('POINT',:SRID);
CREATE INDEX node_geoidx ON qwat_od.node USING GIST ( geometry );

/* constraints */
ALTER TABLE qwat_od.node ADD CONSTRAINT node_fk_precisionalti FOREIGN KEY (fk_precisionalti) REFERENCES qwat_vl.precisionalti(id) MATCH FULL; CREATE INDEX fki_node_fk_precisionalti ON qwat_od.node(fk_precisionalti);


