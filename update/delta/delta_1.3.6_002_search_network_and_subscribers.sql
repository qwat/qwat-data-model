

/*
Check if a valve is a subscriber valve
*/
CREATE OR REPLACE FUNCTION qwat_network.ft_check_valve_is_subscriber(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    _function integer;
begin
    select fk_valve_function into _function from qwat_od.valve where id = _id;
    if _function = 6105 or _function = 6108 then
        return true;
    end if;
    return false;
end
$function$
;


CREATE OR REPLACE FUNCTION qwat_network.ft_search_network_and_subscribers(start_pipe integer, max_km integer DEFAULT 20, stop_on_network_valves boolean DEFAULT false, stop_on_subscriber_valves boolean DEFAULT false, stop_on_current_pressure_zone boolean DEFAULT false)
 RETURNS TABLE(id integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare
    start_node integer;
    start_node2 integer;
    pipe_list integer[]='{0}';
    rec record;
    pipe integer;
    pressure_zone integer;
    sql text;
    condition_pressure_zone text := '';
    condition_subscriber_valve text := '';
    condition_network_valve text := '';
begin
    select n.source, n.target into start_node, start_node2 from qwat_network.network n where n.id = start_pipe;
    
    if stop_on_current_pressure_zone then 
        pressure_zone = (select fk_pressurezone from qwat_od.pipe p where p.id = start_pipe);
        condition_pressure_zone = ' and fk_pressurezone = ' || pressure_zone;
    end if;
    
    if stop_on_subscriber_valves then
        condition_subscriber_valve = ' and not qwat_network.ft_check_valve_is_subscriber(ng.source) and not qwat_network.ft_check_valve_is_subscriber(ng.target) ';
    end if;
    
    if stop_on_network_valves then
        condition_subscriber_valve = ' and not qwat_network.ft_check_valve_is_network(ng.source) and not qwat_network.ft_check_valve_is_network(ng.target) ';
    end if;

    --for rec in 
    sql = format('
        with recursive search_graph(id, source, target, cost, meters, path) as (
            -- Init
            -- We start from a specific pipe
            select 
                g.id, 
                case 
                    when g.target = $1 then g.target
                    else g.source
                end as source,
                case 
                    when g.target = $1 then g.source
                    else g.target
                end as target,
                g.cost, 
                st_length(g.geometry) as meters, 
                case 
                    when g.target = $1 then ARRAY[g.target, g.source]
                    else ARRAY[g.source, g.target]
                end as path
            from 
                qwat_network.network as g 
            where 
                g.source = $1 or g.target = $1
            or g.source = $2 or g.target = $2

            union all

            -- Recursive part
            select
                ng.id,
                ng.source,
                ng.target,
                ng.cost,
                ng.meters + st_length(ng.geometry) as meters,
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
                    sg.meters,
                    sg.path,
                    g.geometry
                from 
                    qwat_network.network as g,
                    search_graph as sg
                where
                    (sg.target = g.source or
                    sg.target = g.target
                    and sg.source <> g.source)
                ) as ng
                join qwat_od.pipe p on p.id = ng.id

            where
                -- Continue while there s no closed valve
                (not qwat_network.ft_check_node_is_closed_valve(ng.source))
                
                -- Be carreful not to cross a node twice
                and not ng.target = any(ng.path)
                
                -- Stop if number of meters is too important
                and ng.meters / 1000 < $3
                
                -- pressure zone
                %s
                
                -- subscriber valves
                %s
                
                -- network valves
                %s
        )
        select distinct sg.id, n.geometry, meters, path
        from search_graph as sg
        join qwat_network.network n on (n.source = sg.source and n.target = sg.target) or (n.target = sg.source and n.source = sg.target)
        ', condition_pressure_zone, condition_subscriber_valve, condition_subscriber_valve);
    for rec in execute sql using start_node, start_node2, max_km
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
