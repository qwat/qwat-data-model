CREATE OR REPLACE FUNCTION qwat_network.ft_search_network_and_subscribers(start_pipe integer, max_depth integer DEFAULT 20)
 RETURNS TABLE(id integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare
    start_node integer;
    start_node2 integer;
    pipe_list integer[]='{0}';
    rec record;
    pipe integer;
begin	
    select n.source, n.target into start_node, start_node2 from qwat_network.network n where n.id = start_pipe;
    
    for rec in 
    with recursive search_graph(id, source, target, cost, depth, path) as (
        -- Init
        -- We start from a specific pipe
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
         or g.source = start_node2 or g.target = start_node2

        union all

        -- Recursive part
        select
            ng.id,
            ng.source,
            ng.target,
            ng.cost,
            ng.depth + 1 as depth,
            ng.path || ng.target
        from
            (select 
                g.id,
                -- case to see witch node is the source or the target
                case 
                    when sg.target=g.target then g.target
                    else g.source
                end as source,
                case 
                    when sg.target=g.target then g.source
                    else g.target
                end as target,
                g.cost,
                sg.depth,
                sg.path
            from 
                qwat_network.network as g,
                search_graph as sg				
            where
                (sg.target = g.source or
                sg.target = g.target
                and sg.source <> g.source)
            ) as ng

        where
            -- Continue while there's no closed valve
            (not qwat_network.ft_check_node_is_closed_valve(ng.source))
            -- Be carreful not to cross a node twice
            and not ng.target = any(ng.path)
            -- Stop if number of recursion is too important
            and ng.depth < max_depth
            
            
            -- vanne réseau : fk_valve_function != 6105 AND fk_valve_function != 6108
            -- vanne abonné : fk_valve_function = 6105 OR fk_valve_function = 6108
            
    )
    select distinct sg.id, n.geometry, depth, path
    from search_graph as sg
    join qwat_network.network n on (n.source = sg.source and n.target = sg.target) or (n.target = sg.source and n.source = sg.target)
    loop
        -- Unique list of pipes
        if not rec.id = any(pipe_list) then
            pipe_list := pipe_list || rec.id;
        end if;
    end loop;
    
    -- Last step: get pipes geometries
    foreach pipe in ARRAY pipe_list
    loop
        select p.id, p.geometry into id, geometry from qwat_od.pipe p where p.id = pipe;
        if id is not null then
            return next;
        end if;
    end loop;
end
$function$
;
