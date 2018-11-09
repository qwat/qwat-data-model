CREATE VIEW qwat_ch_vd_sire.reservoir AS
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
		, storage_total AS Capacite_Stockage
		, storage_supply AS Reserve_Alimentation
		, storage_fire AS Reserve_Incendie
		, CASE WHEN cistern1_dimension_1 > 0 THEN 1 ELSE 0 END +
			CASE WHEN cistern2_dimension_1 > 0 THEN 1 ELSE 0 END AS Nombre_Cuves
		, altitude_overflow AS Altitude_Trop_Plein
		, altitude_apron AS Altitude_Radier
		, CASE WHEN fire_valve IS TRUE THEN 1 ELSE 0 END AS Vanne_Incendie
		, CASE WHEN fire_remote IS TRUE THEN 1 ELSE 0 END AS Telecommande_Incendie
		, 0 AS Centrale_Telecommande
		, qwat_ext_ch_vd_sire_adesafecter AS A_Desaffecter_PDDE
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'tank'
		;
