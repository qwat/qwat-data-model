CREATE VIEW qwat_ch_vd_sire.station_pompage AS
	SELECT
		id AS "ID_Num"
		, qwat_ext_ch_vd_sire_remarque|| remark AS "Remarque"
		, precision_code_sire AS "Precision_Geo"
		, distributor_name AS "Nom_Distributeur"
		, fk_distributor AS "ID_Distributeur"
		, qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_Exploitation"
		, year AS "Annee_Construction"
		, name AS "Nom_Descriptif"
		, folder_identification AS "Numero_Dossier"
		, pressurezone_name AS "Nom_Zone_Pression"
		, fk_pressurezone AS "ID_Zone_Pression"
		, watertype_code_sire AS "Type_Eau"
		, pump_type_code_sire AS "Genre"
		, altitude as "Altitude"
		, rejected_flow as "Q_Max_Refoule"
		, no_pumps as "Nombre_Pompes"
		, manometric_height AS "H_Manometrique"
		, pump_operating_code_sire AS "Fonctionnement"
		, qwat_ext_ch_vd_sire_adesafecter AS "A_Desaffecter_PDDE"
		, ST_Force2D(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE
		installation_type = 'pump'
		;
