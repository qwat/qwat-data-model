INSERT INTO qwat_vl.pipe_material (id, vl_active, short_en, value_en, short_fr, value_fr, short_ro, value_ro, diameter, diameter_nominal, diameter_internal, diameter_external, code_sire, pressure_nominal, sdr, wall_thickness) VALUES (5408, true, '', '', 'FAE', 'Fonte auto-étanche', '', '', '400', 400, 400.000, NULL, 4, 25, NULL, NULL);


-- release constraint for schematic pipes issue https://github.com/qwat/qwat-data-model/issues/299

/*
	qWat - QGIS Water Module
	
	SQL file :: schematic network view

Creation of schema
view pipe_schema_visibleitems select pipe which are visible in schema with the alternative geometry
view pipe_schema_merged       merge the pipes and aggregate (length, closed, etc)
view pipe_schema              join with pipe_view to get pipe properties
*/



Drop view qwat_od.vw_pipe_schema;
Drop view qwat_od.vw_pipe_schema_merged;
		

CREATE OR REPLACE VIEW qwat_od.vw_pipe_schema_merged AS	
WITH RECURSIVE pipe_find_parent(/*path,*/ depth_level, id, groupid, geometry, _length2d, _length3d, tunnel_or_bridge, _valve_count, _valve_closed) AS (
    SELECT 
        --pipe.id::varchar AS path,
		1 AS depth_level,
		pipe.id,
		pipe.id,
		pipe.geometry::geometry(LineStringZ, :SRID),
		pipe._length2d,
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
		St_Multi(ST_LineMerge(ST_Union(geometry))::geometry(MultiLineStringZ,:SRID)) AS geometry,
		COUNT(groupid) AS number_of_pipes,
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
			vw_pipe_schema_merged._length2d       ,
			vw_pipe_schema_merged._length3d       ,
			vw_pipe_schema_merged.number_of_pipes  ,
			vw_pipe_schema_merged.tunnel_or_bridge,
			vw_pipe_schema_merged._valve_count    ,
			vw_pipe_schema_merged._valve_closed   ,
			pressurezone.name AS _pressurezone ,
			pressurezone.colorcode AS _pressurezone_colorcode,
			vw_pipe_schema_merged.geometry::geometry(MultiLineStringZ,:SRID) AS geometry
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