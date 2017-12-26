CREATE VIEW qwat_ch_vd_sire.regulation_pression AS
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
		, CASE
		    WHEN installation_type = 'pump' THEN 2
				ELSE 0
			END AS Genre
		, altitude as Altitude
		, 1 as Etat_Connexion
		, NULL AS ID_Distributeur_2
		, NULL AS ID_Zone_pression_2
		, 0 AS Type_Regulation
		, NULL AS Valeur_Consigne_reg
		, 2 AS Telecommande_incendie
		, NULL AS ID_Centrale_exploitation
		, remote_code_sire AS Type_transmission
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'pump'
		OR
		fk_pressurecontrol_type IN (2801,2802) -- réducteur, coupe-pression

	UNION

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
		, 1 AS Type_eau
		, 1 AS Genre
		, altitude as Altitude
		, 1 as Etat_Connexion
		, NULL AS ID_Distributeur_2
		, NULL AS ID_Zone_pression_2
		, 0 AS Type_Regulation
		, NULL AS Valeur_Consigne_reg
		, 2 AS Telecommande_incendie
		, NULL AS ID_Centrale_exploitation
		, CASE
				WHEN fk_valve_actuation = 6404 THEN 6
				ELSE 0
			END AS Type_transmission
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
    , ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_valve
	WHERE fk_valve_function = 6101  -- vanne régulation
		;
