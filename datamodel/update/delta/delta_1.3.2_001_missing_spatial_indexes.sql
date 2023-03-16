-- Missing spatial indexes

CREATE INDEX cover_geoidx ON qwat_od.cover USING GIST ( geometry );
CREATE INDEX cover_geoidx_polygon ON qwat_od.cover USING GIST ( geometry_polygon );
CREATE INDEX crossing_geoidx ON qwat_od.crossing USING GIST ( geometry );
CREATE INDEX leak_geoidx ON qwat_od.leak USING GIST ( geometry );
CREATE INDEX surveypoint_geoidx ON qwat_od.surveypoint USING GIST ( geometry );
CREATE INDEX valve_geoidx_handle ON qwat_od.valve USING GIST ( handle_geometry );

