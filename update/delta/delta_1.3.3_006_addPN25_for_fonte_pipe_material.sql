
DROP TRIGGER IF EXISTS tr_fancy_value ON qwat_vl.pipe_material;

CREATE TRIGGER tr_fancy_value
	BEFORE INSERT OR UPDATE OF short_fr, short_ro, short_en, diameter, pressure_nominal ON qwat_vl.pipe_material
	FOR EACH ROW
	EXECUTE PROCEDURE qwat_vl.pipe_material_displayname();
COMMENT ON TRIGGER tr_fancy_value ON qwat_vl.pipe_material IS 'Trigger: updates the fancy value_fr, value_ro and value_en in the material table.';

UPDATE qwat_vl.pipe_material set pressure_nominal=25 WHERE value_fr LIKE 'Fonte%'