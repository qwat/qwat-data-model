CREATE VIEW qwat_ch_vd_sire.captage AS
	SELECT
		id AS ID_Num
		, qwat_ext_ch_vd_sire_remarque || remark AS Remarque
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
		, source_type_code_sire AS Genre
		, flow_lowest AS Q_Etiage
		, flow_average AS Q_Moyen
		, source_quality_code_sire AS Qualite_Captage
		, flow_concession AS Q_Concession
		, contract_end AS Date_Fin_Concession
		, CASE
			WHEN gathering_chamber IS TRUE THEN 1
			WHEN gathering_chamber IS FALSE THEN 0
			ELSE 2
		END AS Chambre_De_Rassemblement
		, altitude AS Altitude
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desaffecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'source'
		;
