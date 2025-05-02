CREATE OR REPLACE FUNCTION qwat_network.ft_check_node_is_hydrant(_id integer)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    count integer := 0;
begin
	select count(*) into count from qwat_od.hydrant where id = _id;
    if count > 0 then
        return true;
    end if;
    return false;
end
$function$
;
