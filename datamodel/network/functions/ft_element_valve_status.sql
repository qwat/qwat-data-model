-- Function: ft_element_valve_status :

CREATE OR REPLACE FUNCTION qwat_network.ft_element_valve_status(var_pipe_id integer)
RETURNS boolean
LANGUAGE 'sql'
AS $BODY$
	SELECT
		bool_or(closed) as closed
	FROM
		qwat_od.valve
    WHERE
		fk_pipe=var_pipe_id
    GROUP BY
		fk_pipe
$BODY$;
COMMENT ON FUNCTION qwat_network.ft_element_valve_status(var_pipe_id integer) IS 'Get valve status from pipe ID.';
