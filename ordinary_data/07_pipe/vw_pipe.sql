/*
	qWat - QGIS Water Module
	
	SQL file :: pipe view
*/



DROP VIEW IF EXISTS qwat_od.vw_pipe CASCADE;
CREATE VIEW qwat_od.vw_pipe AS 
	SELECT  
		pipe.id                ,
		pipe.id_parent         ,
		pipe.id_function       ,
		pipe.id_installmethod  ,
		pipe.id_material       ,
		pipe.id_distributor    ,
		pipe.id_precision      ,
		pipe.id_protection     ,
		pipe.id_status         ,
		pipe.schema_force_view ,
		pipe.year              ,
		pipe.tunnel_or_bridge  ,
		pipe.pressure_nominal  ,
		pipe.folder            ,
		pipe.label_1_text      ,
		pipe.remark            ,
		pipe._valve_count      ,
		pipe._valve_closed     ,
		pipe.id_node_a         ,
		pipe.id_node_b         ,
		pipe.id_district       ,
		pipe.id_pressurezone   ,
		pipe.id_printmap       ,
		pipe._length2d         ,
		pipe._length3d         ,
		pipe._diff_elevation   ,
		pipe._printmaps        ,
		pipe._district         ,
		pipe.geometry::geometry(LineString,21781),
		COALESCE(schema_force_view, pipe_function.schema_visible) AS _schema_visible,
 		pipe_function.value_fr          AS _function, 
 		pipe_function.code_sire         AS _function_code_sire, 
		pipe_installmethod.value_fr     AS _installmethod,
		pipe_material._displayname_fr   AS _material_name,
		pipe_material.value_fr          AS _material_longname,
		pipe_material.diameter          AS _material_diameter,
		pipe_material.diameter_internal AS _material_diameter_internal,
		pipe_material.diameter_external AS _material_diameter_external,
		pipe_material.code_sire         AS _material_code_sire,
		distributor.name         AS _distributor,
		precision.value_fr       AS _precision,
		pipe_protection.value_fr AS _protection,
		status.value_fr          AS _status,
		status.active            AS _status_active,
		pressurezone.name        AS _pressurezone,
		pressurezone.colorcode   AS _pressurezone_colorcode
		FROM qwat_od.pipe
		INNER      JOIN qwat_vl.pipe_function      ON pipe.id_function      = pipe_function.id
		INNER      JOIN qwat_vl.pipe_installmethod ON pipe.id_installmethod = pipe_installmethod.id
		INNER      JOIN qwat_vl.pipe_material      ON pipe.id_material      = pipe_material.id
		INNER      JOIN qwat_od.distributor        ON pipe.id_distributor   = distributor.id
		INNER      JOIN qwat_vl.precision          ON pipe.id_precision     = precision.id
		LEFT OUTER JOIN qwat_vl.pipe_protection    ON pipe.id_protection    = pipe_protection.id
		INNER      JOIN qwat_vl.status             ON pipe.id_status        = status.id
		LEFT OUTER JOIN qwat_od.pressurezone       ON pipe.id_pressurezone  = pressurezone.id 
		LEFT OUTER JOIN qwat_od.node AS node_a     ON pipe.id_node_a        = node_a.id
		LEFT OUTER JOIN qwat_od.node AS node_b     ON pipe.id_node_b        = node_b.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW qwat_od.vw_pipe IS 'View for pipe. This view is not editable';


