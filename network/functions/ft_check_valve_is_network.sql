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
COMMENT ON FUNCTION qwat_network.ft_check_valve_is_network(_id integer) IS 'Check if a valve is a network valve.';
