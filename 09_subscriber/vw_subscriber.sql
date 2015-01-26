/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber view
*/

DROP VIEW IF EXISTS qwat_od.vw_subscriber CASCADE;
CREATE VIEW qwat_od.vw_subscriber AS 
	SELECT 
		subscriber.id			  ,
		subscriber.id_type         ,
		subscriber.id_pipe         ,
		subscriber.identification       ,
		subscriber._identification_full ,
		subscriber.parcel          ,
		subscriber.id_district     ,
		subscriber.id_pressurezone ,
		subscriber.id_printmap     ,
		subscriber._pressurezone   ,
		subscriber._printmaps      ,
		subscriber.geometry::geometry(Point,21781),	
		subscriber_type.value_fr AS _type     ,
		district.name            AS _district ,
		pressurezone.colorcode   AS _pressurezone_colorcode
		FROM qwat_od.subscriber
		INNER      JOIN qwat_vl.subscriber_type ON subscriber.id_type         = subscriber_type.id 
		LEFT OUTER JOIN qwat_od.district        ON subscriber.id_district     = district.id
		LEFT OUTER JOIN qwat_od.pressurezone    ON subscriber.id_pressurezone = pressurezone.id;
/* Comment */	
COMMENT ON VIEW qwat_od.vw_subscriber IS 'View for subscriber. This view is not editable ';


