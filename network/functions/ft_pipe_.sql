-- Function: ft_pipe_ : splits each pipe according to the nodes present on its geometry and insert in pipe_reference table

CREATE OR REPLACE FUNCTION qwat_network.ft_pipe_(var_pipe_id integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$DECLARE r record;
DECLARE fk integer;
DECLARE g1 geometry;
DECLARE ml record;
BEGIN
DELETE FROM qwat_network.pipe_reference WHERE fk_pipe=var_pipe_id;
FOR r IN (
	SELECT *,CASE WHEN ST_LineLocatePoint(tblpipe.pg, tblpipe.fk_ag)<ST_LineLocatePoint(tblpipe.pg, tblpipe_nodes.ng) THEN ST_Length(ST_LineSubstring(tblpipe.pg, ST_LineLocatePoint(tblpipe.pg, tblpipe.fk_ag), ST_LineLocatePoint(tblpipe.pg, tblpipe_nodes.ng))) ELSE 99999 END as distance
	FROM (
		SELECT pipe.id as pid,n.id as fk_a,pipe.fk_node_b as fk_b,n.geometry as fk_ag,pipe.geometry as pg
		FROM qwat_od.pipe join qwat_od.node as n on n.id=pipe.fk_node_a
		WHERE pipe.id=var_pipe_id
	) tblpipe join (
		SELECT pipe.id as p_id,n.id as n,n.geometry as ng
		FROM qwat_od.pipe join qwat_od.node as n on n.id not in (pipe.fk_node_a,pipe.fk_node_b) 
		WHERE pipe.id=var_pipe_id
		--and n.id in (select pipe.fk_node_a from qwat_od.pipe union select pipe.fk_node_b from qwat_od.pipe)
		and ST_DWithin(n.geometry, pipe.geometry, 0.003)
		union all
		-- also consider valves which are not on nodes
		SELECT pipe.id as p_id, v.id as n, v.geometry as ng
		FROM qwat_od.pipe 
		join qwat_od.valve v on v.id not in (pipe.fk_node_a,pipe.fk_node_b) 
		where 
		pipe.id=var_pipe_id 
		and ST_DWithin(v.geometry, pipe.geometry, 0.003)
		and NOT EXISTS (
			-- check if valve is on a valve by checking node geometry and distance from the pipe
		    select * 
		    FROM qwat_od.node as n 
		    where n.id = v.id
		    and ST_DWithin(n.geometry, pipe.geometry, 0.003)
		)		
	) tblpipe_nodes on tblpipe.pid=tblpipe_nodes.p_id
	ORDER BY distance
)
LOOP
	IF (fk IS NULL) THEN
		fk = r.fk_a;
	END IF;
	IF (g1 IS NULL) THEN
		g1 = r.pg;
	END IF;
	-- split line by nodes ST_Distance(g1,r.ng)*1.5
	SELECT ST_NumGeometries(ST_CollectionExtract(ST_Split(ST_Snap(g1,r.ng,0.003),r.ng),2)) as nr,
	ST_GeometryN(ST_CollectionExtract(ST_Split(ST_Snap(g1,r.ng,0.003),r.ng),2),1) as l1,
	ST_GeometryN(ST_CollectionExtract(ST_Split(ST_Snap(g1,r.ng,0.003),r.ng),2),2) as l2 INTO ml;
	-- insert line into pipe_reference
	INSERT INTO qwat_network.pipe_reference(fk_pipe,fk_node_a,fk_node_b,geometry) 
	SELECT r.pid,fk,r.n,ST_Force2D(ml.l1);
	fk = r.n;
	g1 = ml.l2;
END LOOP;
IF (r IS NOT NULL) THEN
	INSERT INTO qwat_network.pipe_reference(fk_pipe,fk_node_a,fk_node_b,geometry) 
	SELECT r.pid,fk,r.fk_b,ST_Force2D(g1);
END IF;
RETURN 0;
END;
$function$
;
COMMENT ON FUNCTION qwat_network.ft_pipe_(var_pipe_id integer) IS 'Splits each pipe according to the nodes present on its geometry and insert in pipe_reference table.';
