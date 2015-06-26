
/*
	qWat - QGIS Water Module
	
	SQL file :: valves view
*/

/* TODO: maintenance */

DROP VIEW IF EXISTS qwat_od.vw_valve CASCADE;
CREATE VIEW qwat_od.vw_valve AS 
SELECT  
	valve.id                ,
	valve.identification    ,
	valve.fk_type           ,
	valve.fk_function       ,
	valve.fk_status         ,
	valve.fk_node_precision ,
	valve.fk_maintenance    ,
	valve.fk_pipe           ,
	valve.diameter_nominal  ,
	valve.year              ,
	valve.closed            ,
	valve.node_altitude_real,
	valve.remark            ,
	valve.schema_force_visible ,
	valve.fk_node           ,
	valve.fk_district       ,
	valve.fk_pressurezone   ,
	valve.fk_printmap       ,
	valve._district         ,
	valve._pressurezone     ,
	valve._printmaps        ,
	valve.geometry::geometry(Point,21781)   ,
	COALESCE(schema_force_visible, valve_function.schema_visible) AS _schema_visible,
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
	INNER JOIN      qwat_vl.valve_type     ON valve.fk_type         = valve_type.id
	INNER JOIN      qwat_vl.valve_function ON valve.fk_function     = valve_function.id
	INNER      JOIN qwat_vl.status         ON valve.fk_status       = status.id
	LEFT OUTER JOIN qwat_od.node           ON valve.fk_node         = node.id       
	LEFT OUTER JOIN qwat_od.district       ON valve.fk_district     = district.id       
	LEFT OUTER JOIN qwat_od.pressurezone   ON valve.fk_pressurezone = pressurezone.id;
	
