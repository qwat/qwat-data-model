CREATE OR REPLACE FUNCTION qwat_network.ft_check_valve_is_active(_id integer)
	RETURNS boolean
	LANGUAGE plpgsql
AS $function$
declare 
	is_active boolean := true;
	BEGIN
		select status.active into is_active from qwat_od.valve valve
		join qwat_vl.status status on valve.fk_status = status.id
	 	where valve.id = _id;
	 	return is_active;
	END;
$function$
;
COMMENT ON FUNCTION qwat_network.ft_check_valve_is_active(_id integer) IS 'Check if a valve is active.';
