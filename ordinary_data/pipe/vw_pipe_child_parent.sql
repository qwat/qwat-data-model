/*
	qWat - QGIS Water Module
	
	SQL file :: draw lines from children to parent (pipe)

*/



/*
view to sraw arrows from children to parent
this shoud be used as soon as ST_lineToCurve works for 3 points
		ST_CurveToLine(ST_LineToCurve( ST_AddPoint( vector , ST_MakePoint( ST_X(middle_point)+distance*cos(azimuth),ST_Y(middle_point)+distance*sin(azimuth) ) , 1 ) ) ,15)::geometry(LineString,:SRID) AS geometry
then this should be added to select of foo2
		ST_MakeLine( start_point , end_point )::geometry(LineString,:SRID) AS vector,
*/

CREATE OR REPLACE VIEW qwat_od.vw_pipe_child_parent AS
	SELECT child, parent,
		 ST_CurveToLine(ST_GeomFromEWKT('SRID=:SRID;CIRCULARSTRING('
			||ST_X(start_point)||' '||ST_Y(start_point)
			||','||
			ST_X(middle_point)+distance*cos(azimuth)||' '||ST_Y(middle_point)+distance*sin(azimuth)
			||','||
			ST_X(end_point)||' '||ST_Y(end_point) 
			||')'
		),15)::geometry(LineString,:SRID) AS geometry
	FROM (
		SELECT child,parent,
			start_point , end_point ,
			pi()/2+ST_Azimuth(start_point,end_point) AS azimuth,
			.5*ST_Distance(start_point,end_point) AS distance,
			ST_Line_Interpolate_Point(ST_MakeLine( start_point , end_point ),.5)::geometry(Point,:SRID) AS middle_point
		FROM (
			SELECT a.id AS child ,b.id AS parent, 
					ST_Line_Interpolate_Point(a.geometry,.5)::geometry(Point,:SRID) AS start_point,
					/* select end_point at 4 meters from the closest side of the pipe */
					ST_ClosestPoint(ST_MakeLine(  
						ST_Line_Interpolate_Point(b.geometry,   LEAST(1,  4/b._length2d/2))::geometry(Point,:SRID) ,
						ST_Line_Interpolate_Point(b.geometry,GREATEST(0,1-4/b._length2d/2))::geometry(Point,:SRID) 
					),a.geometry) AS end_point
			FROM qwat_od.pipe a 
			INNER JOIN qwat_od.pipe b ON a.fk_parent = b.id
			WHERE a.fk_parent IS NOT NULL
		) AS foo
	) AS foo2;
	

