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
COMMENT ON FUNCTION qwat_network.ft_check_node_is_valve(_id integer, _check_if_network_function boolean) IS 'Check if a node is a valve. If the parameter _check_if_network_function is true, then we also check if the valve is a network valve.';
