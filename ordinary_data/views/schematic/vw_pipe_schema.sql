/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipe_schema_visibleitems select pipe which are visible in schema with the alternative geometry
view pipe_schema_merged       merge the pipes and aggregate (length, closed, etc)
view pipe_schema              join with pipe_view to get pipe properties
*/



/* create a view with the visible items */
CREATE OR REPLACE VIEW qwat_od.vw_pipe_schema_visibleitems AS 
	SELECT 	
		pipe.id,
		pipe.fk_parent,
		pipe.fk_material,
                ST_Length(pipe.geometry) AS _length2d,
		pipe._length3d,
		pipe.tunnel_or_bridge,
		pipe.schema_force_visible,
		pipe.geometry_alt2::geometry(LineStringZ,:SRID) AS geometry,
		pipe._valve_count,
		pipe._valve_closed
	FROM qwat_od.pipe
	INNER JOIN qwat_vl.status ON pipe.fk_status = status.id
	INNER JOIN qwat_vl.pipe_function ON pipe.fk_function = pipe_function.id
	WHERE COALESCE(schema_force_visible, pipe_function.schema_visible) IS TRUE
	AND status.active IS TRUE;
COMMENT ON VIEW qwat_od.vw_pipe_schema_visibleitems IS 'visible pipe in the schematic view (before merge)';

CREATE OR REPLACE RULE rl_pipe_update_alternative AS
	ON UPDATE TO qwat_od.vw_pipe_schema_visibleitems DO INSTEAD
		UPDATE qwat_od.pipe SET
			fk_parent = NEW.fk_parent,
			schema_force_visible = NEW.schema_force_visible,
			geometry_alt2 = NEW.geometry
		WHERE id = NEW.id;
	
CREATE OR REPLACE RULE rl_pipe_delete_alternative AS
	ON DELETE TO qwat_od.vw_pipe_schema_visibleitems DO INSTEAD
		UPDATE qwat_od.pipe SET
			schema_force_visible = FALSE
		WHERE id = OLD.id;	
		
		

CREATE OR REPLACE VIEW qwat_od.vw_pipe_schema_merged AS	
WITH RECURSIVE pipe_find_parent(/*path,*/ depth_level, id, groupid, geometry, _length2d, _length3d, tunnel_or_bridge, _valve_count, _valve_closed) AS (
    SELECT 
        --pipe.id::varchar AS path,
		1 AS depth_level,
		pipe.id,
		pipe.id,
		pipe.geometry::geometry(LineStringZ,:SRID),
                _length2d,
		pipe._length3d,
		pipe.tunnel_or_bridge,
		pipe._valve_count,
		pipe._valve_closed
    FROM qwat_od.vw_pipe_schema_visibleitems pipe WHERE pipe.fk_parent IS NULL
UNION ALL
    SELECT 
		--fp.path || '<-' || pipe.id,
		fp.depth_level + 1 AS depth_level,
		pipe.id,
		fp.groupid,
		pipe.geometry::geometry(LineStringZ,:SRID),
                pipe._length2d,
		pipe._length3d,
		pipe.tunnel_or_bridge,
		pipe._valve_count,
		pipe._valve_closed
    FROM pipe_find_parent AS fp
    INNER JOIN qwat_od.vw_pipe_schema_visibleitems pipe on fp.id = pipe.fk_parent
    AND fp.depth_level < 20
) 
	SELECT 
		groupid AS id,
		ST_LineMerge(ST_Union(geometry))::geometry(LineStringZ,:SRID) AS geometry,
		COUNT(groupid) AS number_of_pipe,
                SUM(_length2d) AS _length2d,
		SUM(_length3d) AS _length3d,
		bool_or(tunnel_or_bridge) AS tunnel_or_bridge,
		SUM(_valve_count) AS _valve_count,
		bool_or(_valve_closed) AS _valve_closed
	 FROM pipe_find_parent GROUP BY groupid ;


/* 
Join with pipe_view to get pipe properties
*/
CREATE OR REPLACE VIEW qwat_od.vw_pipe_schema AS
	SELECT	
			pipe.id				               ,
			pipe.fk_function                   ,
			pipe.fk_installmethod              ,
			pipe.fk_material                   ,
			pipe.fk_distributor                ,
			pipe.fk_precision                  ,
			pipe.fk_protection                 ,
			pipe.fk_status                     ,
			pipe.fk_folder                     ,
			pipe.year                          ,
			pipe.year_end                      ,
			pipe.pressure_nominal              ,
			pipe.remark                        , 
			pipe.fk_district                   ,
			pipe.fk_pressurezone               ,
			pipe.fk_printmap                   ,
			pipe._printmaps                    ,
			pipe.label_2_visible               ,
			pipe.label_2_text                  ,
                        vw_pipe_schema_merged._length2d	      ,
			vw_pipe_schema_merged._length3d       ,
			vw_pipe_schema_merged.number_of_pipe  ,
			vw_pipe_schema_merged.tunnel_or_bridge,
			vw_pipe_schema_merged._valve_count    ,
			vw_pipe_schema_merged._valve_closed   ,
			pressurezone.name AS _pressurezone ,
			pressurezone.colorcode AS _pressurezone_colorcode,
			vw_pipe_schema_merged.geometry::geometry(LineStringZ,:SRID) AS geometry
	FROM qwat_od.vw_pipe_schema_merged
	INNER JOIN qwat_od.pipe         ON pipe.id = vw_pipe_schema_merged.id
	LEFT JOIN qwat_od.pressurezone ON pipe.fk_pressurezone = pressurezone.id;
COMMENT ON VIEW qwat_od.vw_pipe_schema IS 'Final view for schema';

/* label update rule */
CREATE RULE rl_pipe_schema_label
	AS ON UPDATE TO qwat_od.vw_pipe_schema DO INSTEAD
		UPDATE qwat_od.pipe SET 
			label_2_visible = NEW.label_2_visible,
			label_2_text    = NEW.label_2_text
		WHERE id = OLD.id;

/* 
Add node id
*/
/*
CREATE MATERIALIZED VIEW qwat_od.vw_pipe_schema_node AS
	SELECT 
		foo.*,
		CASE
			WHEN tunnel_or_bridge IS TRUE THEN NULL
			ELSE abs(node_a.altitude-node_b.altitude)
		END AS _diff_elevation,
		CASE
			WHEN tunnel_or_bridge IS TRUE THEN NULL
			ELSE abs(node_a.altitude-node_b.altitude)/_length3d
		END AS _slope
	FROM
		( SELECT	
			vw_pipe_schema.*,
			qwat_od.fn_get_node(ST_StartPoint(geometry)) AS fk_node_a,
			qwat_od.fn_get_node(ST_EndPoint(  geometry)) AS fk_node_b	
			FROM qwat_od.vw_pipe_schema 
		) AS foo
		LEFT OUTER JOIN qwat_od.node AS node_a ON fk_node_a = node_a.id
		LEFT OUTER JOIN qwat_od.node AS node_b ON fk_node_b = node_b.id; 
COMMENT ON MATERIALIZED VIEW qwat_od.vw_pipe_schema_node IS 'Final view for schema completed with node.';
*/
/*
Report schema errors
*/
CREATE OR REPLACE VIEW qwat_od.vw_pipe_schema_error AS
WITH RECURSIVE pipe_find_parent_error(PATH, depth_level, id, groupid, geometry) AS (
    SELECT 
		pipe.id::varchar AS path,
		1 AS depth_level,
		pipe.id,
		pipe.id,
		pipe.geometry::geometry(LineStringZ,:SRID)
		FROM qwat_od.vw_pipe_schema_visibleitems pipe WHERE pipe.fk_parent IS NULL
UNION ALL
    SELECT 
		fp.path || '<-' || pipe.id,
		fp.depth_level + 1 AS depth_level,
		pipe.id,
		fp.groupid,
		pipe.geometry::geometry(LineStringZ,:SRID)
    FROM pipe_find_parent_error AS fp
    INNER JOIN qwat_od.vw_pipe_schema_visibleitems pipe on fp.id = pipe.fk_parent
    AND fp.depth_level < 20
) 
	SELECT * 
		FROM
		( SELECT
				groupid, 
				ST_Multi(ST_LineMerge(ST_Union(geometry))) AS geometry,
				'lines cannot be joined'::varchar AS error_desc
			FROM pipe_find_parent_error
			GROUP BY groupid
		) AS foo
		WHERE geometryType(ST_CollectionHomogenize(geometry)) != 'LINESTRING'
	UNION 
	SELECT 
		groupid,
		geometry,
		'circular referencing loop'::varchar AS error_desc
	FROM pipe_find_parent_error
	WHERE depth_level > 19;
COMMENT ON VIEW qwat_od.vw_pipe_schema_error IS 'Report IDs of parent pipe where pipe concatenation leads to a MultiLineString and not to a LineString or if an infinite referencing loop has been detected.';





