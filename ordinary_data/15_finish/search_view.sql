


CREATE OR REPLACE VIEW qwat_od.vw_search_view AS
	/* ouvrages */
	SELECT
		'Ouvrages' as layer_name,
		'Réservoir ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.installation_tank 
		INNER JOIN qwat_vl.status ON installation_tank.fk_status = status.id
		WHERE status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Pompage ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.installation_pump 
		INNER JOIN qwat_vl.status ON installation_pump.fk_status = status.id
		WHERE status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Source ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.installation_source
		INNER JOIN qwat_vl.status ON installation_source.fk_status = status.id
		WHERE status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Traitement ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.installation_treatment 
		INNER JOIN qwat_vl.status ON installation_treatment.fk_status = status.id
		WHERE status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Régulation de pression ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.installation_pressurecontrol 
		INNER JOIN qwat_vl.status ON installation_pressurecontrol.fk_status = status.id
		WHERE status.active IS TRUE
	UNION SELECT
		'Ouvrages' as layer_name,
		'Chambre de vannes ' || identification || ' ' || name as search_text,
		geometry
		FROM qwat_od.installation_valvechamber
		INNER JOIN qwat_vl.status ON installation_valvechamber.fk_status = status.id
		WHERE status.active IS TRUE
		
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
		_identification_full as search_text,
		geometry
		FROM qwat_od.meter
		
	UNION SELECT
		'Vannes' as layer_name,
		_function || ' ' || identification || ' ' || _district as search_text,
		geometry
		FROM qwat_od.vw_valve WHERE identification IS NOT NULL;
