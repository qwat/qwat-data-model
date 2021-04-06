CREATE OR REPLACE FUNCTION qwat_od.ft_search_path(start_node integer, end_node integer, max_depth integer DEFAULT 20)
 RETURNS TABLE(id integer, source integer, target integer, geometry geometry)
 LANGUAGE plpgsql
AS $function$
declare 
	path integer[];
	node integer;
	node_0 integer;
begin
	with recursive 
    -- la CTE
    search_graph(id, source, target, cost, depth, path) as (
        -- Initialisation
        -- on part d'un troncon specifique
        select 
            g.id, 
			case 
				when start_node=g.target then g.target
				else g.source
			end as source,
			case 
				when start_node=g.target then g.source
				else g.target
			end as target,
            g.cost, 
            1 as depth, 
            case 
				when start_node=g.target then ARRAY[g.target, g.source]
				else ARRAY[g.source, g.target]
			end as path
        from 
            qwat_od.network as g 
        where 
            g.source = start_node or g.target = start_node            
        union all
        -- Partie récursive
        select
            ng.id,
			ng.source,
			ng.target,
			ng.cost,
			-- on incremente la profondeur a chaque iteration			
			ng.depth + 1 as depth,
			-- on met la target dans le tableau représentant le chemin à parcourir
			ng.path || ng.target
        from
			(select 
				g.id,
				-- si le tronçon suivant a la même target que le tronçon que l'on vient de parcourir, 
				-- il faut inverser et prendre cette target comme source, sinon on prend la source
				case 
					when sg.target=g.target then g.target
					else g.source
				end as source,
				-- si le tronçon suivant a la même target que le tronçon que l'on vient de parcourir, 
				-- il faut inverser et prendre la source comme target, sinon on prend la target
				case 
					when sg.target=g.target then g.source
					else g.target
				end as target,
				g.cost,
				sg.depth,
				sg.path
			from 
            -- la table qu'on jointure : c'est le graphe (au format pgrouting)
				qwat_od.network as g,
			--join
            -- la CTE
				search_graph as sg				
			where
			--on
				-- on jointure la CTE et network pour se déplacer dans le graphe
				-- on cherche le tronçon qui a la target du tronçon précédent comme source
				-- (ou comme target si le réseau n'a pas été saisi correctement et on inverse ensuite)		
				(sg.target = g.source or
				sg.target = g.target
				and sg.source <> g.source)
			) as ng

        where
        	-- on continue tant qu'on n'est pas au noeud d'arrivée
			(ng.source <> end_node)
			-- on ne repasse pas par un noeud déjà dans le chemin à parcourir (on ne revient pas en arrière)
			and not ng.target = any(ng.path)
			-- on s'arrête à une profondeur pour ne pas parcourir le réseau entier
			and ng.depth < max_depth
            -- et on ne passe pas par les vannes fermées
            --and sg.cost != -1            
	)
	-- on met le chemin dans une variable pour construire ensuite le linéaire avec les géométries
    select sg.path into path
		from search_graph as sg
 		where sg.target = end_node
		order by sg.depth, sg.source, sg.target
		limit 1;
    
	if path is not null then
		-- on prend le premier noeud du chemin (noeud de départ)
		node_0 := path[1];
		-- on part ensuite du deuxième noeud pour construire chaque géométrie
	    foreach node in array path[2:]
		loop
			select n.id, n.source, n.target, n.geometry into id, source, target, geometry from qwat_od.network n
			-- on cherche le tronçon avec source et target égales au noeud n et noeud n + 1
			-- (ou l'inverse si les tronçons n'ont pas été saisis correctement)
	    	where (n.source = node_0 and n.target = node) or (n.target = node_0 and n.source = node);
	--   	    raise notice 'node 0 % ; node %', node_0, node;
			-- on passe au noeud suivant pour chercher le prochain tronçon
	    	node_0 := node;
	    	-- on renvoie la ligne de résultat dans la table
	        return next;
	--        raise notice 'node %', node;
		end loop;
	end if;	
end
$function$
;