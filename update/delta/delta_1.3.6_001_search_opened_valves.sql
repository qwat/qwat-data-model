alter table qwat_network.network add column if not exists network_id serial ;

/*
Check if a node is a valve
Is the parameter _check_if_network_function is true, then we also check if the valve is a network valve
*/
CREATE OR REPLACE FUNCTION qwat_network.ft_check_node_is_valve(_id integer, _check_if_network_function boolean)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    count integer := 0;
    is_network boolean := false;
begin
    
    --raise notice 'vanne %', _id;
--     if _id = 54387 then
--         raise notice 'vanne 54387 %', _check_if_network_function;
--     end if;

    select count(*) into count from qwat_od.valve where id = _id;
    if count > 0 then
        if _check_if_network_function then
            is_network := (select qwat_network.ft_check_valve_is_network(_id));
            if is_network then
                --raise notice '---------- vanne réseau';
                return true;
            else
                return false;
            end if;
        end if;
        return true;
    end if;
    return false;
end
$function$
;

/*
Check if a valve is a network valve
*/
CREATE OR REPLACE FUNCTION qwat_network.ft_check_valve_is_network(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    _function integer;
begin
    select fk_valve_function into _function from qwat_od.valve where id = _id;
    if _function != 6105 and _function != 6108 then
        return true;
    end if;
    return false;
end
$function$
;


CREATE OR REPLACE FUNCTION qwat_network.ft_search_opened_valves(start_pipe integer, max_depth integer DEFAULT 20, stop_on_network_valves boolean DEFAULT true)
 RETURNS TABLE(id integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare 
    valve integer;
    pipe integer;
    valve_list integer[]='{0}';
    rec record;
    res boolean;
begin
    for rec in 
    with recursive
    -- la CTE
    search_graph(id, source, target, depth, path) as (
        -- Init, we start from a specific pipe
        select
            g.id,
            fk_node_a as source,
            fk_node_b as target,
            1 as depth,
            ARRAY[g.id] as path
        from 
            qwat_od.pipe as g  -- start on a pipe (not on the network)
        where
            g.id = start_pipe

        union all

        -- Partie récursive
        select
            g.network_id,
            g.source,
            g.target,
            sg.depth + 1 as depth, -- increase recusion depth
            sg.path || g.network_id -- we store each pipe traveled
        from
        qwat_network.network as g
        join search_graph as sg on g.target = sg.source or g.source = sg.target or g.target = sg.target or g.source = sg.source
        where
            -- if the pipe has already been travel, do not take it again
            not g.network_id = any(sg.path)
            -- security: maximum depth of recusion
            and sg.depth < max_depth
            -- if a node is a valve, then we stop (valves are the goal)
            -- unless stop_on_network_valves is true. In that case, we only stop on network valves
            and not qwat_network.ft_check_node_is_valve(sg.source, stop_on_network_valves) 
            and not qwat_network.ft_check_node_is_valve(sg.target, stop_on_network_valves)
    )
    select *
        from search_graph sg
    loop
        select qwat_network.ft_check_node_is_valve(rec.source, stop_on_network_valves) into res;
        if res and not rec.source = any(valve_list) then
            valve_list := valve_list || rec.source;
        end if;
        select qwat_network.ft_check_node_is_valve(rec.target, stop_on_network_valves) into res;
        if res and  not rec.target = any(valve_list) then
            valve_list := valve_list || rec.target;
        end if;
    end loop;

    -- Last step: get valves geometries
    foreach valve in ARRAY valve_list
    loop
        select v.id, v.geometry into id, geometry from qwat_od.valve v where v.id = valve;
        if id is not null then
            return next;
        end if;
    end loop;

end
$function$
;
