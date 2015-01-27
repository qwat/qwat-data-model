/*
	qWat - QGIS Water Module
	
	SQL file :: node
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS qwat_od.node CASCADE;
CREATE TABLE qwat_od.node (id serial PRIMARY KEY);

COMMENT ON TABLE qwat_od.node IS 'Nodes. Type:If three pipe or more arrives at the node: three. If one pipe: one. If two: depends on characteristics of pipe: two_same (everything same), two_year (year is different), two_material (and year is/are different), two_diameter (and material/year are different). Orientation is calculated if two pipe arrives to place the symbol in theright direction.';

/* columns */
ALTER TABLE qwat_od.node ADD COLUMN altitude_dtm    decimal(10,3)              ;
ALTER TABLE qwat_od.node ADD COLUMN _type           varchar(40) default null ;
ALTER TABLE qwat_od.node ADD COLUMN _orientation    float       default 0    ;
ALTER TABLE qwat_od.node ADD COLUMN _schema_visible boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _status_active  boolean     default false;
ALTER TABLE qwat_od.node ADD COLUMN _under_object   boolean     default false;

/* geometry */
SELECT AddGeometryColumn('qwat_od', 'node', 'geometry', 21781, 'POINT', 2)  ;
CREATE INDEX node_geoidx ON qwat_od.node USING GIST ( geometry );


/*----------------!!!---!!!----------------*/
/* Trigger for geometry (=> altitude) */
CREATE OR REPLACE FUNCTION qwat_od.ft_node_geom() RETURNS trigger AS 
$BODY$ 
	BEGIN
		NEW.altitude_dtm := NULL;
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.ft_node_geom() IS 'Fcn/Trigger: set uptodate to false for altitude when geometry changes.';

CREATE TRIGGER tr_node_geom
	BEFORE UPDATE OF geometry ON qwat_od.node
		FOR EACH ROW
		EXECUTE PROCEDURE qwat_od.ft_node_geom();
COMMENT ON TRIGGER tr_node_geom ON qwat_od.node IS 'Trigger: uset uptodate to false for altitude when geometry changes.';



