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
COMMENT ON FUNCTION qwat_network.ft_search_path(start_node integer, end_node integer, max_depth integer) IS 'Returns network path from a start node to an end node by using qwat_network.network table.';
