CREATE VIEW qwat_ch_vd_sire.station_pompage AS
	SELECT 
		id AS "ID_Num",
		qwat_ext_ch_vd_sire_remarque || remark AS "Remarque",
		distributor_name AS "Nom_Distributeur",
		pressurezone_name AS "Nom_Zone_Pression",
		precision_code_sire AS "Precision_Geo",
		fk_distributor AS "ID_Distributeur",
		qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_Exploitation",
		year AS "Annee_Construction",
		name AS "Nom_Descriptif",
		folder_identification AS "Numero_Dossier",
		fk_pressurezone AS "ID_Zone_Pression",
		watertype_code_sire AS "Type_Eau",
		pump_type_code_sire AS "Genre",
		altitude AS "Altitude",
		rejected_flow AS "Q_Max_Refoule",
		no_pumps AS "Nombre_Pompes",
		manometric_height AS "H_Manometrique",
		pump_operating_code_sire AS "Fonctionnement",
		qwat_ext_ch_vd_sire_adesafecter AS "A_Desaffecter_PDDE",
		st_force2d(geometry) AS geometry
	FROM qwat_od.vw_export_installation
	WHERE installation_type = 'pump'::qwat_od.installation_type AND (status_functional IS TRUE OR fk_status = 1306) AND fk_distributor = 1;
