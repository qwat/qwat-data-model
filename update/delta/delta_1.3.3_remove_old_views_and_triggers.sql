
-- From earlier versions of QWAT there was some qwat_od.vw_installation_xxx views, which are not required anymore.

DROP VIEW IF EXISTS qwat_od.vw_installation_pressurecontrol;
DROP VIEW IF EXISTS qwat_od.vw_installation_pump;
DROP VIEW IF EXISTS qwat_od.vw_installation_source;
DROP VIEW IF EXISTS qwat_od.vw_installation_tank;
DROP VIEW IF EXISTS qwat_od.vw_installation_treatment;
DROP VIEW IF EXISTS qwat_od.vw_installation_chamber;

DROP function IF EXISTS qwat_od.ft_installation_chamber_delete();
DROP function IF EXISTS qwat_od.ft_installation_chamber_insert();
DROP function IF EXISTS qwat_od.ft_installation_chamber_update();

DROP function IF EXISTS qwat_od.ft_installation_pressurecontrol_delete();
DROP function IF EXISTS qwat_od.ft_installation_pressurecontrol_insert();
DROP function IF EXISTS qwat_od.ft_installation_pressurecontrol_update();

DROP function IF EXISTS qwat_od.ft_installation_pump_delete();
DROP function IF EXISTS qwat_od.ft_installation_pump_insert();
DROP function IF EXISTS qwat_od.ft_installation_pump_update();

DROP function IF EXISTS qwat_od.ft_installation_source_delete();
DROP function IF EXISTS qwat_od.ft_installation_source_insert();
DROP function IF EXISTS qwat_od.ft_installation_source_update();

DROP function IF EXISTS qwat_od.ft_installation_tank_delete();
DROP function IF EXISTS qwat_od.ft_installation_tank_insert();
DROP function IF EXISTS qwat_od.ft_installation_tank_update();

DROP function IF EXISTS qwat_od.ft_installation_treatment_delete();
DROP function IF EXISTS qwat_od.ft_installation_treatment_insert();
DROP function IF EXISTS qwat_od.ft_installation_treatment_update();


