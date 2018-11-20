CREATE VIEW qwat_ch_vd_sire.station_traitement AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque|| remark AS Remarque
		, precision_code_sire AS Precision_Geo
		, distributor_name AS Nom_Distributeur
		, fk_distributor AS ID_Distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, name AS Nom_Descriptif
		, folder_identification AS Numero_Dossier
		, pressurezone_name AS Nom_Zone_Pression
		, fk_pressurezone AS ID_Zone_Pression
		, watertype_code_sire AS Type_Eau
		, CASE WHEN sanitization_uv IS TRUE THEN 1 ELSE 0 END AS UV_Rayon_Desinfection
		, CASE WHEN sanitization_chlorine_liquid IS TRUE THEN 1 ELSE 0 END AS Chlore_Liquide_Desinfection
		, CASE WHEN sanitization_chlorine_gas IS TRUE THEN 1 ELSE 0 END AS Chlore_Gazeux_Desinfection
		, CASE WHEN sanitization_ozone IS TRUE THEN 1 ELSE 0 END AS Ozone_Desinfection
		, CASE WHEN filtration_membrane IS TRUE THEN 1 ELSE 0 END AS Membrane_Filtration
		, CASE WHEN filtration_sandorgravel IS TRUE THEN 1 ELSE 0 END AS Sable_ou_Gravier_Filtration
		, CASE WHEN flocculation IS TRUE THEN 1 ELSE 0 END AS Floculation
		, CASE WHEN activatedcharcoal IS TRUE THEN 1 ELSE 0 END AS Charbon_Actif_Filtration
		, CASE WHEN settling IS TRUE THEN 1 ELSE 0 END AS Decantation
		, treatment_capacity AS Capacite_Traitement
		, 2 AS Electricite_Fonctionnement
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desaffecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'treatment'
		;
