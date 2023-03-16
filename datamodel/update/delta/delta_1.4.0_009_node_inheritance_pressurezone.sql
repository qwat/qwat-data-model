-- Drop constraint
ALTER TABLE qwat_od.node DROP CONSTRAINT IF EXISTS node_fk_pressurezone;

-- Change pressurezone type in node table
ALTER TABLE qwat_od.node 
ALTER COLUMN fk_pressurezone SET DATA TYPE integer[]
USING ARRAY[fk_pressurezone];
ALTER TABLE qwat_od.node 
ALTER COLUMN fk_pressurezone
SET DEFAULT array[]::integer[];
DROP INDEX IF EXISTS fki_node_fk_pressurezone;

CREATE OR REPLACE FUNCTION qwat_od.fn_get_pressurezones(geometry) RETURNS integer[] AS
$BODY$ 
	DECLARE
		geom ALIAS FOR $1;
		fk_pressurezone integer[];
	BEGIN
		fk_pressurezone := ARRAY(
			SELECT 
				pressurezone.id
			FROM  qwat_od.pressurezone
			WHERE ST_Intersects(geom,pressurezone.geometry) IS true
		);
		RETURN fk_pressurezone;
	END
$BODY$
LANGUAGE plpgsql;
COMMENT ON FUNCTION qwat_od.fn_get_pressurezones(geometry) IS 'Returns the id of overlapping pressurezones.';

CREATE OR REPLACE FUNCTION qwat_od.ft_node_geom()
  RETURNS trigger AS
$BODY$
	BEGIN
		NEW.geometry            := ST_Force3D(NEW.geometry);
		NEW.fk_district         := qwat_od.fn_get_district(NEW.geometry);
		NEW.fk_pressurezone     := qwat_od.fn_get_pressurezones(NEW.geometry);
		NEW.fk_printmap         := qwat_od.fn_get_printmap_id(NEW.geometry);
		NEW._printmaps          := qwat_od.fn_get_printmaps(NEW.geometry);
		RETURN NEW;
	END;
$BODY$
LANGUAGE plpgsql;
