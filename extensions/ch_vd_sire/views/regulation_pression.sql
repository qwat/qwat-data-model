CREATE VIEW qwat_ch_vd_sire.regulation_pression AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque || remark AS Remarque
		, precision_code_sire AS Precision_Geo
		, fk_distributor AS ID_Distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder_identification AS Numero_Dossier
		, fk_pressurezone AS ID_Zone_Pression
		, watertype_code_sire AS Type_Eau
		, CASE
		    WHEN installation_type = 'pump' THEN 2
				ELSE 0
			END AS Genre
		, altitude as Altitude
		, 1 as Etat_Connexion
		, NULL AS ID_Distributeur_2
		, NULL AS ID_Zone_Pression_2
		, 0 AS Type_Regulation
		, NULL AS Valeur_Consigne_Reg
		, 2 AS Telecommande_Incendie
		, 0 AS Centrale_Telecommande
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desaffecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		fk_pressurecontrol_type IN (2801,2802) -- réducteur, coupe-pression

	UNION

	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque || remark AS Remarque
		, precision_code_sire AS Precision_Geo
		, fk_distributor AS ID_Distributeur
		, qwat_ext_ch_vd_sire_etat_exploitation AS Etat_Exploitation
		, year AS Annee_Construction
		, NULL::text AS Nom_Descriptif
		, folder_identification AS Numero_Dossier
		, fk_pressurezone AS ID_Zone_Pression
		, 1 AS Type_Eau
		, 1 AS Genre
		, altitude as Altitude
		, 1 as Etat_Connexion
		, NULL AS ID_Distributeur_2
		, NULL AS ID_Zone_pression_2
		, 0 AS Type_Regulation
		, NULL AS Valeur_Consigne_Reg
		, 2 AS Telecommande_Incendie
		, 0 AS Centrale_Telecommande
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desaffecter_PDDE
    , ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_valve
	WHERE fk_valve_function = 6101  -- vanne régulation
		;
