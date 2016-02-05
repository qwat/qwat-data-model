


CREATE OR REPLACE VIEW qwat_od.vw_search_view AS
	/* ouvrages */SELECT
		'Ouvrages' as layer_name,
		CASE 
			WHEN installation_type = 'source'::qwat_od.installation_type THEN	'Source ' || identification || ' ' || name
			WHEN installation_type = 'treatment'::qwat_od.installation_type THEN	'Traitement ' || identification || ' ' || name
			WHEN installation_type = 'tank'::qwat_od.installation_type THEN	'Réservoir ' || identification || ' ' || name
			WHEN installation_type = 'pressurecontrol'::qwat_od.installation_type THEN	'Régulation de pression ' || identification || ' ' || name
			WHEN installation_type = 'pump'::qwat_od.installation_type THEN	'Pompage ' || identification || ' ' || name
			WHEN installation_type = 'chamber'::qwat_od.installation_type THEN	'Chambre ' || identification || ' ' || name
		END AS search_text,
		ST_Force2d(geometry) AS geometry
		FROM qwat_od.vw_export_installation
		WHERE status_active IS TRUE
	UNION SELECT
		'Hydrantes' as layer_name,
		district_name || ' '|| identification as search_text,
		ST_Force2d(geometry) AS geometry
		FROM qwat_od.vw_export_hydrant WHERE status_active IS TRUE

	UNION SELECT
		'Abonnés' as layer_name,
		subscriber_type_value_fr || ' ' || coalesce(district_prefix||'_','') || identification || ' ' || district_name as search_text,
		ST_Force2d(geometry) AS geometry
		FROM qwat_od.vw_export_subscriber

	UNION SELECT
		'Compteur' as layer_name,
		COALESCE(district_prefix||'_')||meter.identification AS search_text,
		ST_Force2d(meter.geometry) AS geometry
		FROM qwat_od.vw_export_meter meter

	UNION SELECT
		'Vannes' as layer_name,
		valve_function_value_fr || ' ' || identification || ' ' || district_name as search_text,
		ST_Force2d(geometry) AS geometry
		FROM qwat_od.vw_export_valve WHERE identification IS NOT NULL;
