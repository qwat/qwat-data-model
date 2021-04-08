alter table qwat_od.network add network_id serial;

CREATE OR REPLACE FUNCTION qwat_od.ft_check_node_is_valve(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    count integer := 0;
begin

    select count(*) into count from qwat_od.valve where id = _id;
    if count > 0 then
        return true;
    end if;
    return false;
end
$function$
;

CREATE OR REPLACE FUNCTION qwat_od.ft_search_opened_valves(start_pipe integer, max_depth integer DEFAULT 20)
 RETURNS TABLE(id integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare 
    valve integer;
    pipe integer;
    valve_list integer[]='{0}';
    rec record;
begin
    for rec in 
    with recursive
    -- la CTE
    search_graph(id, source, target, source_is_valve, target_is_valve, depth, path) as (
        -- Init, we start from a specific pipe
        select
            g.id,
            fk_node_a as source,
            fk_node_b as target,
            0 as source_is_valve,
            0 as target_is_valve,
            1 as depth,
            ARRAY[g.id] as path
        from 
            qwat_od.pipe as g  -- start on a pipe (not on the netwok)
        where
            g.id = start_pipe

        union all

        -- Partie récursive
        select
            g.network_id,
            g.source,
            g.target,
            v1.id,
            v2.id,
            sg.depth + 1 as depth, -- increase recusion depth
            sg.path || g.network_id -- we store each pipe traveled
        from
        qwat_od.network as g
        join search_graph as sg on g.target = sg.source or g.source = sg.target or g.target = sg.target or g.source = sg.source
        left outer join qwat_od.valve v1 on v1.id = g.source -- join on valve to see if the node is a valve
        left outer join qwat_od.valve v2 on v2.id = g.target -- join on valve to see if the node is a valve
        where
            -- if the pipe has already been travel, do not take it again
            not g.network_id = any(sg.path)
            -- security: maximum depth of recusion
            and sg.depth < max_depth
            -- if a node is a valve, then we stop (valves are the goal)
            and ( not qwat_od.ft_check_node_is_valve(sg.source) and not qwat_od.ft_check_node_is_valve(sg.target))
    )
    select *
        from search_graph sg
    loop
        if rec.source_is_valve is not null and not rec.source_is_valve = any(valve_list) then
           valve_list := valve_list || rec.source_is_valve;
        end if;
        if rec.target_is_valve is not null and not rec.target_is_valve = any(valve_list) then
            valve_list := valve_list || rec.target_is_valve;
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
