-- Function: ft_all_pipes : populates the pipe_reference table

CREATE OR REPLACE FUNCTION qwat_network.ft_all_pipes()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
	rec record;
	nb int;
	c int;
	res int;
BEGIN

	c := 0;
	
	select count(*) into nb from qwat_od.pipe;
	
	FOR rec IN select * from qwat_od.pipe LOOP
		select qwat_network.ft_pipe_(rec.id) into res;
		
		if c % 10 = 0 then 
            raise notice 'Id troncon: % (%/%)', rec.id, c, nb;
        end if;
		c := c + 1;
	END LOOP;
END
$function$
;
COMMENT ON FUNCTION qwat_network.ft_all_pipes() IS 'Populates the pipe_reference table.';
