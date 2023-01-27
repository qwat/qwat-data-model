-- Function: ft_create_network : create table with each pipe section (node to node)

CREATE OR REPLACE FUNCTION qwat_network.ft_create_network()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
	BEGIN
		DROP TABLE IF EXISTS qwat_network.network;
		CREATE TABLE qwat_network.network as 
		SELECT id,
	            fk_node_a as source,
	            fk_node_b as target,
	            CASE 
	                WHEN qwat_network.ft_element_valve_status(id) THEN -1
	                ELSE ST_length(p.geometry) 
	            END as cost,
	            CASE 
	                WHEN qwat_network.ft_element_valve_status(id) THEN -1
	                ELSE ST_length(p.geometry) 
	            END as reverse_cost,
	            geometry as geometry
	        FROM qwat_od.pipe p
	        WHERE (p.id NOT IN (SELECT pipe_reference.fk_pipe
				FROM qwat_network.pipe_reference))
	    UNION
        SELECT 
        	sp.fk_pipe as id,
            sp.fk_node_a as source,
            sp.fk_node_b as target,
            CASE 
                WHEN sp.geometry is not null THEN 
                CASE 
                    WHEN qwat_network.ft_element_valve_status(sp.fk_pipe) THEN -1 
                    ELSE ST_length(sp.geometry) 
                END
                ELSE 0.1
            end as cost,
            CASE 
                WHEN sp.geometry is not null THEN 
                CASE 
                    WHEN qwat_network.ft_element_valve_status(sp.fk_pipe) THEN -1
                    ELSE ST_length(sp.geometry) 
                END 
            ELSE 0.1 
            end as reverse_cost,
            sp.geometry as geometry
        FROM qwat_network.pipe_reference as sp;
        ALTER TABLE qwat_network.network ADD network_id serial; -- unique id for network
	END;
$function$
;
COMMENT ON FUNCTION qwat_network.ft_create_network() IS 'Create table with each pipe section (node to node).';
