CREATE VIEW qwat_ch_vd_sire.captage AS
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
		, source_type_code_sire AS Genre
		, flow_lowest AS Q_Etiage
		, flow_average AS Q_moyen
		, source_quality_code_sire AS Qualite_Captage
		, flow_concession AS Q_concession
		, contract_end AS Date_fin_Concession
		, gathering_chamber AS Chambre_de_Rassemblement
		, NULL AS ID_Qualite -- TODO
		, altitude AS Altitude
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'source'
		;
