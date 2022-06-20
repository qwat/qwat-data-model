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
    is_active boolean := true;
begin
    
    --raise notice 'vanne %', _id;
--     if _id = 54387 then
--         raise notice 'vanne 54387 %', _check_if_network_function;
--     end if;

    select count(*) into count from qwat_od.valve where id = _id;
    if count > 0 then
    	is_active := (select qwat_network.ft_check_valve_is_active(_id));
    	-- Do not consider valves whose status is not active
    	if is_active = false then
	        return false;
    	end if;    
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


CREATE OR REPLACE FUNCTION qwat_network.ft_search_opened_valves(start_pipe integer, _x float, _y float, max_km real DEFAULT 20, 
    stop_on_network_valves boolean DEFAULT true, tolerance real DEFAULT 1)
 RETURNS TABLE(id integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare 
    valve integer;
    pipe integer;
    start_node integer;
    start_node2 integer;
    _network_id integer;
    valve_list integer[]='{0}';
    rec record;
    res boolean;
    sql text;
    crs integer;
begin
	-- Get CRS from qwat_sys.fn_setting_srid function
	sql = format('select qwat_sys.fn_setting_srid();');
	execute sql into crs;
    -- Select a network object from the pipe id and point clicked
    with point_clicked as ( 
        select st_setsrid(st_makepoint(_x,_y),crs) as geom
    )
    select n.network_id, n.source, n.target
    from qwat_network.network n, point_clicked 
    where n.id = start_pipe
    and st_dwithin(point_clicked.geom, n.geometry, tolerance)
    order by st_distance(point_clicked.geom, n.geometry)
    limit 1
    -- order by distance point_clicked<-->line as there could be 2 pipes in result. The closest is the start pipe.
    into _network_id, start_node, start_node2;

    sql = format('
        with recursive search_graph(id, _network_id, source, target, cost, meters, path) as (
            -- Init
            -- We start from a specific pipe, on each node (source and target)
            with start_nodes as ( 
                select 
                    g.id,
                    g.network_id, 
                    $2 as source,
                    $3 as target,
                    g.cost, 
                    st_length(g.geometry) as meters,
                    ARRAY[$2, $3] as path,
                    s.active
                from 
                    qwat_network.network as g
			        join qwat_od.pipe p on g.id = p.id
			        join qwat_vl.status s on p.fk_status = s.id
                where 
                    g.network_id = $1
                UNION 
                select 
                    g.id,
                    g.network_id, 
                    $3 as source,
                    $2 as target,
                    g.cost, 
                    st_length(g.geometry) as meters,
                    ARRAY[$3, $2] as path,
                    s.active
                from 
                    qwat_network.network as g
			        join qwat_od.pipe p on g.id = p.id
			        join qwat_vl.status s on p.fk_status = s.id
                where 
                    (g.network_id = $1)  and (s.active = true)
            )
            select * from start_nodes

            union all

            -- Recursive part
            select
                ng.id,
                ng.network_id,
                ng.source,
                ng.target,
                ng.cost,
                ng.meters + st_length(ng.geometry) as meters,
                ng.path || ng.target,
                ng.active
            from
                (select 
                    g.id,
                    g.network_id,
                    -- case to see which node is the source or the target
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
                    s.active,
                    g.geometry
                from 
                    qwat_network.network as g
					join qwat_od.pipe p on g.id = p.id
		        	join qwat_vl.status s on p.fk_status = s.id,
                    search_graph as sg
                where
                    (
                        sg.target = g.source or sg.target = g.target
                        and sg.source <> g.source
                    )
                    and (s.active = true)
                ) as ng
                join qwat_od.pipe p on p.id = ng.id

            where
                -- Be carreful not to cross a node twice
                not ng.target = any(ng.path)
                
                -- Stop if number of meters is too important
                and ng.meters / 1000 < $4
                
                -- Stop only on network valves ?
                and not qwat_network.ft_check_node_is_valve(ng.source, $5)

				-- Stop if pipe has not active status to true
				and ng.active = true
        )
        select distinct sg._network_id, sg.source, sg.target, n.geometry, meters, path
        from search_graph as sg
        join qwat_network.network n on n.network_id = sg._network_id

    for rec in execute sql using network_id, start_node, start_node2, max_km, stop_on_network_valves
   /* loop
        -- Unique list of network pipes
        if not rec.network_id = any(network_list) then
            network_list := network_list || rec.network_id;
        end if;
    end loop;
*/
    loop
        RAISE NOTICE '%', rec;
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
