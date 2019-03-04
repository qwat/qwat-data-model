CREATE VIEW qwat_ch_vd_sire.vanne_clapet AS
	SELECT
		id AS "ID_Num",
		qwat_ext_ch_vd_sire_remarque || remark AS "Remarque",
		distributor_name AS "Nom_Distributeur",
		pressurezone_name AS "Nom_Zone_Pression",
		precision_code_sire AS "Precision_Geo",
		fk_distributor AS "ID_Distributeur",
		qwat_ext_ch_vd_sire_etat_exploitation AS "Etat_Exploitation",
		year AS "Annee_Construction",
		NULL::text AS "Nom_Descriptif",
		folder_identification AS "Numero_Dossier",
		fk_pressurezone AS "ID_Zone_Pression",
		1 AS "Type_Eau",
		CASE
			WHEN fk_valve_function = 6107 THEN 0 -- incendie
			WHEN fk_valve_type = 6307 THEN 3 -- clapet
			ELSE 1
		-- TODO disconnecteurs???
		END AS "Genre",
		CASE
			WHEN closed IS TRUE THEN 3
			WHEN fk_valve_type = 6307 THEN 0
			WHEN closed IS FALSE THEN 2
			ELSE 1
		END AS "Etat_Connexion",
		altitude AS "Altitude",
		NULL::integer AS "ID_Distributeur_2",
		NULL::integer AS "ID_Zone_pression_2",
		CASE
			WHEN fk_valve_function = 6107 AND fk_valve_actuation = 6404 THEN 1
			ELSE 0
		END AS "Telecommande_Incendie",
		0 AS "Centrale_Telecommande",
		st_force2d(geometry) AS geometry
	FROM qwat_od.vw_export_valve
	WHERE networkseparation IS TRUE OR fk_valve_function = 6107 OR fk_valve_type = 6307 AND (status_functional IS TRUE OR fk_status = 1306) AND fk_distributor = 1;
