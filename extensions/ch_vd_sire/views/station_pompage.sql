CREATE VIEW qwat_ch_vd_sire.station_pompage AS
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
		, pump_type_code_sire AS Genre
		, altitude as Altitude
		, rejected_flow as Q_Max_Refoule
		, no_pumps as Nombre_Pompes
		, manometric_height AS H_Manometrique
		, pump_operating_code_sire AS Fonctionnement
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'pump'
		;
