

-- Missing valve constraints

-- ALTER TABLE qwat_od.valve ADD CONSTRAINT chk_valve_altitude_obj_ref CHECK (fk_object_reference IS NOT NULL OR altitude IS NULL );
-- ALTER TABLE qwat_od.valve ADD CONSTRAINT chk_valve_altitude_precisionalti CHECK (fk_precisionalti IS NOT NULL OR altitude IS NULL );


-- From earlier versions of QWAT there was some qwat_od.vw_installation_xxx views, which are not required anymore.

DROP VIEW IF EXISTS qwat_od.vw_installation_pressurecontrol;
DROP VIEW IF EXISTS qwat_od.vw_installation_pump;
DROP VIEW IF EXISTS qwat_od.vw_installation_source;
DROP VIEW IF EXISTS qwat_od.vw_installation_tank;
DROP VIEW IF EXISTS qwat_od.vw_installation_treatment;
DROP VIEW IF EXISTS qwat_od.vw_installation_chamber;

DROP FUNCTION IF EXISTS qwat_od.ft_installation_chamber_delete();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_chamber_insert();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_chamber_update();

DROP FUNCTION IF EXISTS qwat_od.ft_installation_pressurecontrol_delete();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_pressurecontrol_insert();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_pressurecontrol_update();

DROP FUNCTION IF EXISTS qwat_od.ft_installation_pump_delete();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_pump_insert();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_pump_update();

DROP FUNCTION IF EXISTS qwat_od.ft_installation_source_delete();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_source_insert();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_source_update();

DROP FUNCTION IF EXISTS qwat_od.ft_installation_tank_delete();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_tank_insert();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_tank_update();

DROP FUNCTION IF EXISTS qwat_od.ft_installation_treatment_delete();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_treatment_insert();
DROP FUNCTION IF EXISTS qwat_od.ft_installation_treatment_update();