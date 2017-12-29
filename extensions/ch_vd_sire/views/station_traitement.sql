CREATE VIEW qwat_ch_vd_sire.station_traitement AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque|| remark AS remarque
		, NULL AS Date_de_saisie -- TODO
		, NULL AS Dern_M_a_J -- TODO
		, precision_code_sire AS Precision_Geo
		, fk_distributor AS id_distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder_identification AS Numero_dossier
		, fk_pressurezone AS ID_Zone_pression
		, watertype_code_sire AS Type_eau
		, CASE WHEN sanitization_uv IS TRUE THEN 1 ELSE 0 END AS UV_rayon_Desinfection
		, CASE WHEN sanitization_chlorine_liquid IS TRUE THEN 1 ELSE 0 END AS Chlore_liquide_Desinfection
		, CASE WHEN sanitization_chlorine_gazeous IS TRUE THEN 1 ELSE 0 END AS Chlore_gazeux_Desinfection
		, CASE WHEN sanitization_ozone IS TRUE THEN 1 ELSE 0 END AS Ozone_Desinfection
		, CASE WHEN filtration_membrane IS TRUE THEN 1 ELSE 0 END AS Membrane_Filtration
		, CASE WHEN filtration_sandorgravel IS TRUE THEN 1 ELSE 0 END AS Sable_ou_gravier_Filtration
		, CASE WHEN flocculation IS TRUE THEN 1 ELSE 0 END AS Floculation
		, CASE WHEN activatedcharcoal IS TRUE THEN 1 ELSE 0 END AS Charbon_actif_Filtration
		, CASE WHEN settling IS TRUE THEN 1 ELSE 0 END AS Decantation
		, treatment_capacity AS Capacite_traitement
		, 2 AS Electricite_pour_fonctionnement
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'treatment'
		;
