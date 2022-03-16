

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


 RETURNS TABLE(id integer, id_pipe integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare
    start_node integer;
    start_node2 integer;
    network_list integer[]='{0}';
    rec record;
    nid integer;
    network_id integer;
    pressure_zone integer;
    sql text;
    condition_pressure_zone text := '';
    condition_subscriber_valve text := '';
    condition_network_valve text := '';
    crs integer;
begin
	-- Get CRS from qwat_sys.settings
	sql = format('select value from qwat_sys.settings;');
	execute sql into crs;
    -- Select a network object from the pipe id and point clicked
    sql = format('
        with point_clicked as ( 
            select st_setsrid(st_makepoint($1,$2),$4) as geom
        )
        select n.network_id, n.source, n.target
        from qwat_network.network n, point_clicked 
        where n.id = $3
        and st_dwithin(point_clicked.geom, n.geometry, 1);'); -- 1m is enough ?
    execute sql into network_id, start_node, start_node2 using _x, _y, start_pipe, crs;
    
    if stop_on_current_pressure_zone then 
        pressure_zone = (select fk_pressurezone from qwat_od.pipe p where p.id = start_pipe);
        condition_pressure_zone = ' and fk_pressurezone = ' || pressure_zone;
    end if;
    
    if stop_on_subscriber_valves then
        condition_subscriber_valve = ' and not qwat_network.ft_check_valve_is_subscriber(ng.source) ';
    end if;
    
    if stop_on_network_valves then
        condition_network_valve = ' and not qwat_network.ft_check_valve_is_network(ng.source) ';
    end if;

    sql = format('
        with recursive search_graph(id, network_id, source, target, cost, meters, path) as (
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
                    (g.network_id = $1) and (s.active = true)
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
                    (g.network_id = $1) and (s.active = true)
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
                -- Continue while there is no closed valve
                (not qwat_network.ft_check_node_is_closed_valve(ng.source))
                
                -- Be carreful not to cross a node twice
                and not ng.target = any(ng.path)
                
                -- Stop if number of meters is too important
                and ng.meters / 1000 < $4
				
                -- Stop if pipe has not active status to true
				and ng.active = true
                
                -- pressure zone
                %s
                
                -- subscriber valves
                %s
                
                -- network valves
                %s 
        )
        select distinct sg.network_id, n.geometry, meters, path
        from search_graph as sg
        join qwat_network.network n on n.network_id = sg.network_id;
        ', condition_pressure_zone, condition_subscriber_valve, condition_network_valve);

    for rec in execute sql using network_id, start_node, start_node2, max_km
    loop
        -- Unique list of network pipes
        if not rec.network_id = any(network_list) then
            network_list := network_list || rec.network_id;
        end if;
    end loop;
    
    -- Last step: get network geometries
    foreach nid in ARRAY network_list
    loop
        select n.network_id, n.id, n.geometry into id, id_pipe, geometry from qwat_network.network n where n.network_id = nid;
        if id is not null then
            return next;
        end if;
    end loop;
end
$function$
;
