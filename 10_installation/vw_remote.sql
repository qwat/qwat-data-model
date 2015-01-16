CREATE VIEW qwat.vw_remote AS 
	SELECT  
od_distributor.name AS distributor ,
vl_status.value_fr AS status ,
vl_precision.value_fr AS precision,
vl_pipe_material._displayname_fr AS material,
identification 	,
year         	,
origin         	,
destination    	,
folder         	,
plan           	,
remark         	,
label_visible_1	,
label_x_1      	,
label_y_1      	,
label_r_1      	,
label_remark_1 	,
label_visible_2	,
label_x_2      	,
label_y_2      	,
label_r_2      	,
label_remark_2 	,
od_remote.geometry::geometry(MultiLineString,21781) AS geometry
FROM qwat.od_remote
INNER      JOIN qwat.od_distributor   ON od_remote.id_distributor = od_distributor.id
INNER      JOIN qwat.vl_status        ON od_remote.id_status      = vl_status.id
INNER      JOIN qwat.vl_precision     ON od_remote.id_precision   = vl_precision.id
INNER      JOIN qwat.vl_pipe_material ON od_remote.id_material    = vl_pipe_material.id;
