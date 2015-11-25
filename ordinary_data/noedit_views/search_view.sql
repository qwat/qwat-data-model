


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
		geometry
		FROM qwat_od.vw_export_installation
		WHERE status_active IS TRUE
	UNION SELECT
		'Hydrantes' as layer_name,
		_district || ' '|| identification as search_text,
		geometry
		FROM qwat_od.vw_hydrant WHERE _status_active IS TRUE

	UNION SELECT
		'Abonnés' as layer_name,
		_type || ' ' || _identification_full || ' ' || _district as search_text,
		geometry
		FROM qwat_od.vw_subscriber

	UNION SELECT
		'Compteur' as layer_name,
		COALESCE(district.prefix||'_')||meter.identification AS search_text,
		meter.geometry
		FROM qwat_od.vw_element_meter meter
		LEFT OUTER JOIN qwat_od.district ON meter.fk_district = district.id

	UNION SELECT
		'Vannes' as layer_name,
		_function || ' ' || identification || ' ' || _district as search_text,
		geometry
		FROM qwat_od.vw_valve WHERE identification IS NOT NULL;
