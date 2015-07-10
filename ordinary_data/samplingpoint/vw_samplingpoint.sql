/*
	qWat - QGIS Water Module
	
	SQL file :: samplingpoint view
*/

CREATE VIEW qwat_od.vw_samplingpoint AS 
	SELECT  
		samplingpoint.id             ,
		samplingpoint.identification ,
		samplingpoint.fk_district    ,
		samplingpoint.fk_printmap    ,
		samplingpoint.fk_pressurezone,
		samplingpoint._district      ,
		samplingpoint._pressurezone  ,
		samplingpoint._printmaps     ,
		samplingpoint.remark         ,
		samplingpoint.geometry::geometry(Point,:SRID),
		pressurezone.colorcode     AS _pressurezone_colorcode
		FROM qwat_od.samplingpoint
		LEFT OUTER JOIN qwat_od.district      ON samplingpoint.fk_district     = district.id       
		LEFT OUTER JOIN  qwat_od.pressurezone ON samplingpoint.fk_pressurezone = pressurezone.id;
/*----------------!!!---!!!----------------*/
/* Comment */
COMMENT ON VIEW qwat_od.vw_samplingpoint IS 'View for samplingpoint. This view is not editable.';
