
/* EXPORT VIEWS */
CREATE OR REPLACE VIEW qwat_od.vw_chamber_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype
	FROM qwat_od.vw_element_installation i
	INNER JOIN      qwat_vl.status      ON status.id      = i.fk_status
	INNER JOIN      qwat_od.distributor ON distributor.id = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type ON remote_type.id = i.fk_remote
	INNER JOIN      qwat_vl.watertype   ON watertype.id   = i.fk_watertype
	WHERE installation_type = 'chamber';


CREATE OR REPLACE VIEW qwat_od.vw_pressurecontrol_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	pressurecontrol_type.value_fr AS type
	FROM qwat_od.vw_element_installation i
	INNER JOIN      qwat_vl.status               ON status.id               = i.fk_status
	INNER JOIN      qwat_od.distributor          ON distributor.id          = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type          ON remote_type.id          = i.fk_remote
	INNER JOIN      qwat_vl.watertype            ON watertype.id            = i.fk_watertype
	-- specific
	INNER JOIN      qwat_vl.pressurecontrol_type ON pressurecontrol_type.id = i.fk_pressurecontrol_type
	WHERE installation_type = 'pressurecontrol' ;

CREATE OR REPLACE VIEW qwat_od.vw_pump_fr AS
SELECT
	i.*,
	status.value_fr      AS status,
	status.active        AS active,
	distributor.name     AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr   AS watertype,
	pump_type.value_fr   AS type
	FROM qwat_od.vw_element_installation i
	INNER JOIN      qwat_vl.status          ON status.id      = i.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id = i.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id   = i.fk_watertype
	-- specific
	INNER JOIN      qwat_vl.pump_type       ON pump_type.id   = i.fk_pump_type
	WHERE installation_type = 'pump' ;


CREATE OR REPLACE VIEW qwat_od.vw_source_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	source_type.value_fr AS type,
	source_quality.value_fr AS quality
	FROM qwat_od.vw_element_installation i
	INNER JOIN      qwat_vl.status         ON status.id         = i.fk_status
	INNER JOIN      qwat_od.distributor    ON distributor.id    = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type    ON remote_type.id    = i.fk_remote
	INNER JOIN      qwat_vl.watertype      ON watertype.id      = i.fk_watertype
	-- specific
	LEFT OUTER JOIN qwat_vl.source_type    ON source_type.id    = i.fk_source_type
	LEFT OUTER JOIN qwat_vl.source_quality ON source_quality.id = i.fk_quality
	WHERE installation_type = 'source';


CREATE OR REPLACE VIEW qwat_od.vw_tank_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype,
	overflow.value_fr AS overflow,
	tank_firestorage.value_fr AS firestorage,
	cis1.value_fr AS cistern1,
	cis2.value_fr AS cistern2
	FROM qwat_od.vw_element_installation i
	INNER JOIN      qwat_vl.status           ON status.id           = i.fk_status
	INNER JOIN      qwat_od.distributor      ON distributor.id      = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type      ON remote_type.id      = i.fk_remote
	INNER JOIN      qwat_vl.watertype        ON watertype.id        = i.fk_watertype
	-- specific
	LEFT OUTER JOIN qwat_vl.overflow         ON overflow.id         = i.fk_overflow
	LEFT OUTER JOIN qwat_vl.tank_firestorage ON tank_firestorage.id = i.fk_firestorage
	LEFT OUTER JOIN qwat_vl.cistern    cis1  ON cis1.id             = i.cistern1_fk_type
	LEFT OUTER JOIN qwat_vl.cistern    cis2  ON cis2.id             = i.cistern2_fk_type
	WHERE installation_type = 'tank'
	;


CREATE OR REPLACE VIEW qwat_od.vw_treatment_fr AS
SELECT
	i.*,
	status.value_fr AS status,
	status.active AS active,
	distributor.name AS distributor,
	remote_type.value_fr AS remote,
	watertype.value_fr AS watertype
	FROM qwat_od.vw_element_installation i
	INNER JOIN      qwat_vl.status          ON status.id          = i.fk_status
	INNER JOIN      qwat_od.distributor     ON distributor.id     = i.fk_distributor
	LEFT OUTER JOIN qwat_vl.remote_type     ON remote_type.id     = i.fk_remote
	INNER JOIN      qwat_vl.watertype       ON watertype.id       = i.fk_watertype
	WHERE installation_type = 'treatment'
	-- specific
	;
