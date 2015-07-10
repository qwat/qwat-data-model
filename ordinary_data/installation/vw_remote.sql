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
label_1_visible ,
label_1_x      	,
label_1_y      	,
label_1_rotation     	,
label_1_text 	,
label_2_visible	,
label_2_x      	,
label_2_y      	,
label_2_rotation     	,
label_2_text 	,
remote.geometry::geometry(MultiLineString,21781) AS geometry
FROM qwat_od.remote
INNER      JOIN qwat_od.distributor   ON remote.fk_distributor = distributor.id
INNER      JOIN qwat_vl.status        ON remote.fk_status      = status.id
INNER      JOIN qwat_vl.precision     ON remote.fk_precision   = precision.id
INNER      JOIN qwat_vl.pipe_material ON remote.fk_material    = pipe_material.id;
