
/*
	qWat - QGIS Water Module
	
	SQL file :: valvles view
*/

/* TODO: maintenance */

DROP VIEW IF EXISTS qwat_od.vw_valve CASCADE;
CREATE VIEW qwat_od.vw_valve AS 
SELECT  
	valve.id                ,
	valve.identification    ,
	valve.id_type           ,
	valve.id_function       ,
	valve.id_status         ,
	valve.id_precision      ,
	valve.id_maintenance    ,
	valve.id_pipe           ,
	valve.diameter_nominal  ,
	valve.year              ,
	valve.closed            ,
	valve.altitude_real     ,
	valve.remark            ,
	valve.schema_force_view ,
	valve.id_node           ,
	valve.id_district       ,
	valve.id_pressurezone   ,
	valve.id_printmap       ,
	valve._district         ,
	valve._pressurezone     ,
	valve._printmaps        ,
	valve.geometry::geometry(Point,21781)   ,
	COALESCE(schema_force_view, valve_function.schema_visible) AS _schema_visible,
	valve_function.value_fr AS _function    ,
	valve_function.short_fr AS _function_shortname ,
	valve_type.value_fr     AS _type        ,
	CASE 
		WHEN valve_function.short_fr IS NULL THEN valve.identification::varchar
		ELSE valve_function.short_fr || valve.identification::varchar
	END AS _label,
	status.value_fr          AS _status,
	status.active            AS _status_active,
	node.altitude_dtm       AS _altitude_dtm,
	pressurezone.colorcode  AS _pressurezone_colorcode
	FROM qwat_od.valve
	INNER JOIN      qwat_vl.valve_type     ON valve.id_type         = valve_type.id
	INNER JOIN      qwat_vl.valve_function ON valve.id_function     = valve_function.id
	INNER      JOIN qwat_vl.status         ON valve.id_status       = status.id
	LEFT OUTER JOIN qwat_od.node           ON valve.id_node         = node.id       
	LEFT OUTER JOIN qwat_od.district       ON valve.id_district     = district.id       
	LEFT OUTER JOIN qwat_od.pressurezone   ON valve.id_pressurezone = pressurezone.id;
	
