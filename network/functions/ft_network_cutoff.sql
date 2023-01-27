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
