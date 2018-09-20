CREATE VIEW qwat_ch_vd_sire.vanne_clapet AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque|| remark AS Remarque
		, precision_code_sire AS Precision_Geo
		, distributor_name AS Nom_Distributeur
		, fk_distributor AS ID_Distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder_identification AS Numero_Dossier
		, pressurezone_name AS Nom_Zone_Pression
		, fk_pressurezone AS ID_Zone_Pression
		, 1 AS Type_Eau
		, CASE
		    WHEN fk_valve_function = 6107 THEN 0 -- incendie
				WHEN fk_valve_type = 6307 THEN 3 -- clapet
				ELSE 1
				-- TODO disconnecteurs???
			END AS Genre
		, CASE
				WHEN closed IS TRUE THEN 3
				WHEN fk_valve_type = 6307 THEN 0
				WHEN closed IS FALSE THEN 2
				ELSE 1
			END AS Etat_Connexion
		, altitude AS Altitude
		, NULL AS ID_Distributeur_2
		, NULL AS ID_Zone_Pression_2
		, CASE
		    WHEN fk_valve_function = 6107 AND fk_valve_actuation = 6404 THEN 1
				ELSE 0
			END AS Telecommande_Incendie
		, 6 AS Type_Transmission
    , ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_valve
	WHERE
		(
			networkseparation IS TRUE
			OR
			fk_valve_function = 6107  -- vanne incendie
			OR
			fk_valve_type = 6307  -- clapet anti-retour
		);
