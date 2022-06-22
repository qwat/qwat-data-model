-- Table: qwat_network.pipe_reference : contains each pipe section with source node and end node

CREATE SCHEMA IF NOT EXISTS qwat_network;

CREATE TABLE qwat_network.pipe_reference
(
    id serial,
    fk_pipe integer,
    fk_node_a integer,
    fk_node_b integer,
    geometry geometry,
    CONSTRAINT pipe_reference_pkey PRIMARY KEY (id),
    CONSTRAINT pipe_reference_fk_pipe_fkey FOREIGN KEY (fk_pipe)
        REFERENCES qwat_od.pipe (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
    
-- Index: pipe_reference_fk_pipe_idx

CREATE INDEX pipe_reference_fk_pipe_idx
    ON qwat_network.pipe_reference USING btree
    (fk_pipe)
    TABLESPACE pg_default; 

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

-- Function: ft_all_pipes : populates the pipe_reference table

CREATE OR REPLACE FUNCTION qwat_network.ft_all_pipes()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
	rec record;
	nb int;
	c int;
	res int;
BEGIN

	c := 0;
	
	select count(*) into nb from qwat_od.pipe;
	
	FOR rec IN select * from qwat_od.pipe LOOP
		select qwat_network.ft_pipe_(rec.id) into res;
		
		if c % 10 = 0 then 
            raise notice 'Id troncon: % (%/%)', rec.id, c, nb;
        end if;
		c := c + 1;
	END LOOP;
END
$function$
;

-- View: qwat_network.vw_pipe_reference : contains pipes which are not in pipe_reference table

CREATE OR REPLACE VIEW qwat_network.vw_pipe_reference AS
 SELECT sp.id,
    sp.fk_node_a,
    sp.fk_node_b,
    sp.geometry,
    sp.fk_pipe
   FROM qwat_network.pipe_reference sp
UNION
 SELECT p.id,
    p.fk_node_a,
    p.fk_node_b,
    p.geometry,
    p.id AS fk_pipe
   FROM qwat_od.pipe p
  WHERE (p.id NOT IN ( SELECT pipe_reference.fk_pipe
           FROM qwat_network.pipe_reference));

-- Function: ft_element_valve_status :

CREATE OR REPLACE FUNCTION qwat_network.ft_element_valve_status(var_pipe_id integer)
RETURNS boolean
LANGUAGE 'sql'
AS $BODY$
	SELECT
		bool_or(closed) as closed
	FROM
		qwat_od.valve
    WHERE
		fk_pipe=var_pipe_id
    GROUP BY
		fk_pipe
$BODY$;

-- Function: ft_create_network : create table with each pipe section (node to node)

CREATE OR REPLACE FUNCTION qwat_network.ft_create_network()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
		DROP TABLE IF EXISTS qwat_network.network;
		CREATE TABLE qwat_network.network as 
		SELECT id,
	            fk_node_a as source,
	            fk_node_b as target,
	            CASE 
	                WHEN qwat_network.ft_element_valve_status(id) THEN -1
	                ELSE ST_length(p.geometry) 
	            END as cost,
	            CASE 
	                WHEN qwat_network.ft_element_valve_status(id) THEN -1
	                ELSE ST_length(p.geometry) 
	            END as reverse_cost,
	            geometry as geometry
	        FROM qwat_od.pipe p
	        WHERE (p.id NOT IN (SELECT pipe_reference.fk_pipe
				FROM qwat_network.pipe_reference))
	    UNION
        SELECT 
        	sp.fk_pipe as id,
            sp.fk_node_a as source,
            sp.fk_node_b as target,
            CASE 
                WHEN sp.geometry is not null THEN 
                CASE 
                    WHEN qwat_network.ft_element_valve_status(sp.fk_pipe) THEN -1 
                    ELSE ST_length(sp.geometry) 
                END
                ELSE 0.1
            end as cost,
            CASE 
                WHEN sp.geometry is not null THEN 
                CASE 
                    WHEN qwat_network.ft_element_valve_status(sp.fk_pipe) THEN -1
                    ELSE ST_length(sp.geometry) 
                END 
            ELSE 0.1 
            end as reverse_cost,
            sp.geometry as geometry
        FROM qwat_network.pipe_reference as sp;
        ALTER TABLE qwat_network.network ADD network_id serial; -- unique id for network
	END;
$function$
;

-- Function: ft_search_path : returns network path from a start node to an end node by using qwat_network.network table

CREATE OR REPLACE FUNCTION qwat_network.ft_search_path(start_node integer, end_node integer, max_depth integer DEFAULT 20)
 RETURNS TABLE(id integer, source integer, target integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare 
	path integer[];
	node integer;
	node_0 integer;
begin
	with recursive 
    -- CTE
    search_graph(id, source, target, cost, depth, path) as (
        -- Initialize first iteration
        -- from specific pipe created in network table
        select 
            g.id, 
			case 
				when start_node=g.target then g.target
				else g.source
			end as source,
			case 
				when start_node=g.target then g.source
				else g.target
			end as target,
            g.cost, 
            1 as depth, 
            case 
				when start_node=g.target then ARRAY[g.target, g.source]
				else ARRAY[g.source, g.target]
			end as path
        from 
            qwat_network.network as g 
        where 
            g.source = start_node or g.target = start_node            
        union all
        -- Recursive part
        select
            ng.id,
			ng.source,
			ng.target,
			ng.cost,
			-- increment depth for each iteration			
			ng.depth + 1 as depth,
			-- target in path to know all the nodes to go through
			ng.path || ng.target
        from
			(select 
				g.id,
				-- if next pipe has same target than pipe that has been run through,
				-- then, it needs to switch and take target of the next pipe as source. Otherwise, it needs to take source of the next pipe as source.
				case 
					when sg.target=g.target then g.target
					else g.source
				end as source,
				-- if next pipe has same target than pipe that has been run through,
				-- then, it needs to switch and take source of the next pipe as target. Otherwise, it needs to take target of the next pipe as target.
				case 
					when sg.target=g.target then g.source
					else g.target
				end as target,
				g.cost,
				sg.depth,
				sg.path
			from 
            -- joined table : it is graph created in network table
				qwat_network.network as g,
            -- CTE
				search_graph as sg
			-- join CTE and network table to move in the graph
			where
				-- search for pipe which has target of previous pipe as source
				-- (or as target if network has been digitalized in reverse and we then switch)
				(sg.target = g.source or
				sg.target = g.target
				and sg.source <> g.source)
			) as ng

        where
        	-- continue still we are not at the end_node
			(ng.source <> end_node)
			-- continue as it is not a node that has been already run through in the path
			and not ng.target = any(ng.path)
			-- stop at max depth
			and ng.depth < max_depth       
	)
	-- path as variable to build geometries
    select sg.path into path
		from search_graph as sg
 		where sg.target = end_node
		order by sg.depth, sg.source, sg.target
		limit 1;
    
	if path is not null then
		-- firt node (start_node)
		node_0 := path[1];
		-- loop on each node to build geometries
	    foreach node in array path[2:]
		loop
			select n.id, n.source, n.target, n.geometry into id, source, target, geometry from qwat_network.network n
			-- search for pipe with source = node n and target = node n+1
			-- (or reverse)
	    	where (n.source = node_0 and n.target = node) or (n.target = node_0 and n.source = node);
	--   	    raise notice 'node 0 % ; node %', node_0, node;
			-- next node to search next pipe
	    	node_0 := node;
			-- return result in table
	        return next;
	--        raise notice 'node %', node;
		end loop;
	end if;	
end
$function$
;

select qwat_network.ft_all_pipes();

select qwat_network.ft_create_network();

CREATE OR REPLACE FUNCTION qwat_network.ft_network_cutoff(valves integer[], pipe integer,  max_km real DEFAULT 20)
 RETURNS TABLE(id integer, source integer, target integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare
	start_node integer;
begin	
	select n.source into start_node from qwat_network.network n where n.network_id = pipe;
	if start_node = any(valves) then 
		select n.target into start_node from qwat_network.network n where n.network_id = pipe;
	end if;
--	select p.fk_node_a into start_node from qwat_od.pipe p where p.id = pipe;
	return query
	with recursive 
    -- CTE
    search_graph(id, source, target, cost, meters, path) as (
        -- Initialize first iteration
        -- from a specific pipe created in network table
        select 
            g.id, 
			case 
				when start_node=g.target then g.target
				else g.source
			end as source,
			case 
				when start_node=g.target then g.source
				else g.target
			end as target,
            g.cost, 
			st_length(g.geometry) as meters,
            case 
				when start_node=g.target then ARRAY[g.target, g.source]
				else ARRAY[g.source, g.target]
			end as path,
			s.active
        from 
            qwat_network.network as g
        	join qwat_od.pipe p on g.id = p.id
        	join qwat_vl.status s on p.fk_status = s.id
        where 
            (g.source = start_node or g.target = start_node) and (s.active = true)
        union all
        -- Recursive part
        select
            ng.id,
			ng.source,
			ng.target,
			ng.cost,
			-- increment depth for each iteration
			ng.meters + st_length(ng.geometry) as meters,
			-- target in path to know all the nodes to go through
			ng.path || ng.target,
			ng.active
        from
			(select 
				g.id,
				-- if next pipe has same target than pipe that has been run through,
				-- then, it needs to switch and take target of the next pipe as source. Otherwise, it needs to take source of the next pipe as source.
				case 
					when sg.target=g.target then g.target
					else g.source
				end as source,
				-- if next pipe has same target than pipe that has been run through,
				-- then, it needs to switch and take source of the next pipe as target. Otherwise, it needs to take target of the next pipe as target.
				case 
					when sg.target=g.target then g.source
					else g.target
				end as target,
				g.cost,
				sg.meters,
				sg.path,
				s.active,
				g.geometry
			from 
            -- joined table : it is graph created in network table
				qwat_network.network as g
				join qwat_od.pipe p on g.id = p.id
	        	join qwat_vl.status s on p.fk_status = s.id,
            -- CTE
				search_graph as sg				
			-- join CTE and network table to move in the graph
			where
				-- search for pipe which has target of previous pipe as source
				-- (or as target if network has been digitalized in reverse and we then switch)
				(sg.target = g.source or
				sg.target = g.target
				and sg.source <> g.source)
				and (s.active = true)
			) as ng

        where
         	-- do not consider valves whose status is not active
        	not qwat_network.ft_check_valve_is_active(ng.source) or 
        	(
	        	-- continue if valve is not closed
				(not qwat_network.ft_check_node_is_closed_valve(ng.source))
				-- continue if valve is not selected by user (consider it as closed if it is selected)
				and not ng.source = any(valves)
				-- node is not already in path
				and not ng.target = any(ng.path)
				-- Stop if number of meters is too important
				and ng.meters / 1000 < $3
				-- continue if pipe status is active
				and ng.active = true
			)			
	)
	select distinct sg.id, sg.source, sg.target, n.geometry
	from search_graph as sg
	join qwat_network.network n on (n.source = sg.source and n.target = sg.target) or (n.target = sg.source and n.source = sg.target);
end
$function$
;

CREATE OR REPLACE FUNCTION qwat_network.ft_check_node_is_hydrant(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    count integer := 0;
begin
	select count(*) into count from qwat_od.hydrant where id = _id;
    if count > 0 then
        return true;
    end if;
    return false;
end
$function$
;

CREATE OR REPLACE FUNCTION qwat_network.ft_check_node_is_closed_valve(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    count integer := 0;
    closed boolean := false;
begin
    select count(*) into count from qwat_od.valve where id = _id;
    if count > 0 then
    	select v.closed into closed from qwat_od.valve v where id = _id;
        return closed;
    end if;
    return false;
end
$function$
;
