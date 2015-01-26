CREATE VIEW qwat_od.vw_remote AS 
	SELECT  
distributor.name AS distributor ,
status.value_fr AS status ,
precision.value_fr AS precision,
pipe_material._displayname_fr AS material,
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
remote.geometry::geometry(MultiLineString,21781) AS geometry
FROM qwat_od.remote
INNER      JOIN qwat_od.distributor   ON remote.id_distributor = distributor.id
INNER      JOIN qwat_vl.status        ON remote.id_status      = status.id
INNER      JOIN qwat_vl.precision     ON remote.id_precision   = precision.id
INNER      JOIN qwat_vl.pipe_material ON remote.id_material    = pipe_material.id;
