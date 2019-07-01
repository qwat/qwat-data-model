CREATE OR REPLACE VIEW qwat_ch_vd_sire.zone_pression AS
	SELECT
		pressurezone.id AS "ID_Num",
		NULL::text AS "Remarque",
		pressurezone.name AS "Nom_Descriptif",
		distributor.name AS "Nom_Distributeur",
		consumptionzone.qwat_ext_ch_vd_sire_pressure_load_type AS "Mise_En_Charge",
		consumptionzone.qwat_ext_ch_vd_sire_pressure_load_altitude AS "Altitude_Plan_De_Charge"
		FROM qwat_od.pressurezone
		JOIN qwat_od.distributor ON pressurezone.fk_distributor = distributor.id
		JOIN qwat_od.consumptionzone ON pressurezone.fk_consumptionzone = consumptionzone.id
	WHERE pressurezone.fk_distributor = 1;
