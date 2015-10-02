/*
	qWat - QGIS Water Module
	
	SQL file :: subscriber view
*/

CREATE VIEW qwat_od.vw_subscriber AS 
	SELECT 
		subscriber.id,
		subscriber.fk_subscriber_type ,
		subscriber.fk_pipe         ,
		subscriber.identification   ,
		COALESCE(district.prefix||'_')||subscriber.identification AS _identification_full ,
		subscriber.parcel          ,
		subscriber.fk_district     ,
		subscriber.fk_pressurezone ,
		subscriber.fk_printmap     ,
		subscriber._printmaps      ,
		subscriber.geometry::geometry(Point,:SRID),	
		subscriber_type.value_fr AS _type     ,
		district.name            AS _district ,
		pressurezone.colorcode   AS _pressurezone_colorcode
		FROM qwat_od.vw_element_subscriber subscriber
		INNER      JOIN qwat_vl.subscriber_type ON subscriber.fk_subscriber_type = subscriber_type.id 
		LEFT OUTER JOIN qwat_od.district        ON subscriber.fk_district        = district.id
		LEFT OUTER JOIN qwat_od.pressurezone    ON subscriber.fk_pressurezone    = pressurezone.id;
/* Comment */	
COMMENT ON VIEW qwat_od.vw_subscriber IS 'View for subscriber. This view is not editable ';


