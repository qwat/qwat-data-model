CREATE VIEW qwat_ch_vd_sire.reservoir AS
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
		, storage_total AS Capacite_Stockage
		, storage_supply AS Reserve_Alimentation
		, storage_fire AS Reserve_Incendie
		, CASE WHEN cistern1_dimension_1 > 0 THEN 1 ELSE 0 END +
			CASE WHEN cistern2_dimension_1 > 0 THEN 1 ELSE 0 END AS Nombre_Cuves
		, altitude_overflow AS Altitude_trop_plein
		, altitude_apron AS Altitude_radier
		, CASE WHEN fire_valve IS TRUE THEN 1 ELSE 0 END AS Vanne_incendie
		, CASE WHEN fire_remote IS TRUE THEN 1 ELSE 0 END AS Telecommande_incendie
		, NULL AS ID_Centrale_exploitation
		, remote_code_sire AS Type_transmission
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desafecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'tank'
		;
