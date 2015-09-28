/*
	qWat - QGIS Water Module
	
	SQL file :: pipe view
*/


CREATE VIEW qwat_od.vw_pipe AS 
	SELECT  
		pipe.id                ,
		pipe.fk_parent         ,
		pipe.fk_function       ,
		pipe.fk_installmethod  ,
		pipe.fk_material       ,
		pipe.fk_distributor    ,
		pipe.fk_precision      ,
		pipe.fk_protection     ,
		pipe.fk_status         ,
		pipe.fk_folder            ,
		pipe.schema_force_visible ,
		pipe.year              ,
		pipe.tunnel_or_bridge  ,
		pipe.pressure_nominal  ,
		pipe.label_1_text      ,
		pipe.remark            ,
		pipe._valve_count      ,
		pipe._valve_closed     ,
		pipe.fk_node_a         ,
		pipe.fk_node_b         ,
		pipe.fk_district       ,
		pipe.fk_pressurezone   ,
		pipe.fk_printmap       ,
		pipe._length2d         ,
		pipe._length3d         ,
		pipe._diff_elevation   ,
		pipe._printmaps        ,
		pipe._district         ,
		pipe.geometry::geometry(LineString,:SRID),
		COALESCE(pipe.schema_force_visible, pipe_function.schema_visible) AS _schema_visible,
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
		pressurezone.colorcode   AS _pressurezone_colorcode,
		folder.name              AS folder
		FROM qwat_od.pipe
		INNER      JOIN qwat_vl.pipe_function      ON pipe.fk_function      = pipe_function.id
		INNER      JOIN qwat_vl.pipe_installmethod ON pipe.fk_installmethod = pipe_installmethod.id
		INNER      JOIN qwat_vl.pipe_material      ON pipe.fk_material      = pipe_material.id
		INNER      JOIN qwat_od.distributor        ON pipe.fk_distributor   = distributor.id
		INNER      JOIN qwat_vl.precision          ON pipe.fk_precision     = precision.id
		LEFT OUTER JOIN qwat_vl.pipe_protection    ON pipe.fk_protection    = pipe_protection.id
		INNER      JOIN qwat_vl.status             ON pipe.fk_status        = status.id
		LEFT OUTER JOIN qwat_od.pressurezone       ON pipe.fk_pressurezone  = pressurezone.id 
		LEFT OUTER JOIN qwat_od.node AS node_a     ON pipe.fk_node_a        = node_a.id
		LEFT OUTER JOIN qwat_od.node AS node_b     ON pipe.fk_node_b        = node_b.id
		LEFT OUTER JOIN qwat_od.folder             ON pipe.fk_folder        = folder.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW qwat_od.vw_pipe IS 'View for pipe. This view is not editable';


