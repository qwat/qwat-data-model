CREATE VIEW qwat_ch_vd_sire.hydrante AS
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
		, CASE WHEN underground IS TRUE THEN 0 ELSE 1 END AS Genre
		, pressure_static AS Pression_Statique
		, pressure_dynamic AS Pression_Dyn_A
		, flow AS Soustirage_A
		, observation_date AS Calc_Date
		, observation_source AS Calc_Source
		, NULL AS Press_Dyn_PDDE
		, NULL AS Soutirage_PDDE
		, NULL AS Sortie_Storz
		, identification AS Numero_BH
		, NULL AS Zone_de_couverture
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_hydrant;
