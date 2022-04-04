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
		WHERE pipe.id=var_pipe_id and ST_Distance(n.geometry,pipe.geometry)>=0 and ST_Distance(n.geometry,pipe.geometry)<0.003 
		--and n.id in (select pipe.fk_node_a from qwat_od.pipe union select pipe.fk_node_b from qwat_od.pipe)
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
  WHERE NOT (p.id IN ( SELECT pipe_reference.fk_pipe
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
	        WHERE NOT (p.id IN (SELECT pipe_reference.fk_pipe
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
        ALTER TABLE qwat_network.network ADD id_network serial; -- unique id for network
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
    -- la CTE
    search_graph(id, source, target, cost, depth, path) as (
        -- Initialisation
        -- on part d'un troncon specifique
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
        -- Partie récursive
        select
            ng.id,
			ng.source,
			ng.target,
			ng.cost,
			-- on incremente la profondeur a chaque iteration			
			ng.depth + 1 as depth,
			-- on met la target dans le tableau représentant le chemin à parcourir
			ng.path || ng.target
        from
			(select 
				g.id,
				-- si le tronçon suivant a la même target que le tronçon que l'on vient de parcourir, 
				-- il faut inverser et prendre cette target comme source, sinon on prend la source
				case 
					when sg.target=g.target then g.target
					else g.source
				end as source,
				-- si le tronçon suivant a la même target que le tronçon que l'on vient de parcourir, 
				-- il faut inverser et prendre la source comme target, sinon on prend la target
				case 
					when sg.target=g.target then g.source
					else g.target
				end as target,
				g.cost,
				sg.depth,
				sg.path
			from 
            -- la table qu'on jointure : c'est le graphe (au format pgrouting)
				qwat_network.network as g,
			--join
            -- la CTE
				search_graph as sg				
			where
			--on
				-- on jointure la CTE et network pour se déplacer dans le graphe
				-- on cherche le tronçon qui a la target du tronçon précédent comme source
				-- (ou comme target si le réseau n'a pas été saisi correctement et on inverse ensuite)		
				(sg.target = g.source or
				sg.target = g.target
				and sg.source <> g.source)
			) as ng

        where
        	-- on continue tant qu'on n'est pas au noeud d'arrivée
			(ng.source <> end_node)
			-- on ne repasse pas par un noeud déjà dans le chemin à parcourir (on ne revient pas en arrière)
			and not ng.target = any(ng.path)
			-- on s'arrête à une profondeur pour ne pas parcourir le réseau entier
			and ng.depth < max_depth
            -- et on ne passe pas par les vannes fermées
            --and sg.cost != -1            
	)
	-- on met le chemin dans une variable pour construire ensuite le linéaire avec les géométries
    select sg.path into path
		from search_graph as sg
 		where sg.target = end_node
		order by sg.depth, sg.source, sg.target
		limit 1;
    
	if path is not null then
		-- on prend le premier noeud du chemin (noeud de départ)
		node_0 := path[1];
		-- on part ensuite du deuxième noeud pour construire chaque géométrie
	    foreach node in array path[2:]
		loop
			select n.id, n.source, n.target, n.geometry into id, source, target, geometry from qwat_network.network n
			-- on cherche le tronçon avec source et target égales au noeud n et noeud n + 1
			-- (ou l'inverse si les tronçons n'ont pas été saisis correctement)
	    	where (n.source = node_0 and n.target = node) or (n.target = node_0 and n.source = node);
	--   	    raise notice 'node 0 % ; node %', node_0, node;
			-- on passe au noeud suivant pour chercher le prochain tronçon
	    	node_0 := node;
	    	-- on renvoie la ligne de résultat dans la table
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
    -- la CTE
    search_graph(id, source, target, cost, meters, path) as (
        -- Initialisation
        -- on part d'un troncon specifique
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
        -- Partie récursive
        select
            ng.id,
			ng.source,
			ng.target,
			ng.cost,
			-- on incremente la profondeur a chaque iteration			
			ng.meters + st_length(ng.geometry) as meters,
			-- on met la target dans le tableau représentant le chemin à parcourir
			ng.path || ng.target,
			ng.active
        from
			(select 
				g.id,
				-- si le tronçon suivant a la même target que le tronçon que l'on vient de parcourir, 
				-- il faut inverser et prendre cette target comme source, sinon on prend la source
				case 
					when sg.target=g.target then g.target
					else g.source
				end as source,
				-- si le tronçon suivant a la même target que le tronçon que l'on vient de parcourir, 
				-- il faut inverser et prendre la source comme target, sinon on prend la target
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
            -- la table qu'on jointure : c'est le graphe (au format pgrouting)
				qwat_network.network as g
				join qwat_od.pipe p on g.id = p.id
	        	join qwat_vl.status s on p.fk_status = s.id,
			--join
            -- la CTE
				search_graph as sg				
			where
			--on
				-- on jointure la CTE et network pour se déplacer dans le graphe
				-- on cherche le tronçon qui a la target du tronçon précédent comme source
				-- (ou comme target si le réseau n'a pas été saisi correctement et on inverse ensuite)		
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
	            --and sg.cost != -1
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
