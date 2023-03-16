CREATE OR REPLACE FUNCTION qwat_network.ft_check_node_is_closed_valve(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    count integer := 0;
    closed boolean := false;
begin
    select count(*) into count from qwat_od.valve where id = _id;
    if count > 0 then
    	select v.closed into closed from qwat_od.valve v where id = _id;
        return closed;
    end if;
    return false;
end
$function$
;
