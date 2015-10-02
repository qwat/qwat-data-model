


CREATE OR REPLACE VIEW qwat_od.vw_search_view AS
	/* ouvrages */
	SELECT
		'Ouvrages' as layer_name,
		'Réservoir ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.vw_tank_fr
		WHERE active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Pompage ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.vw_pump_fr
		WHERE active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Source ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.vw_source_fr
		WHERE active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Traitement ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.vw_treatment_fr
		WHERE active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Régulation de pression ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.vw_pressurecontrol_fr
		WHERE active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Chambre de vannes ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.vw_chamber_fr
		WHERE active IS TRUE

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
