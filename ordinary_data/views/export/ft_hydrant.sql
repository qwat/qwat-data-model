DROP TRIGGER tr_element_hydrant_update ON qwat_od.vw_element_hydrant;

DROP FUNCTION qwat_od.ft_element_hydrant_update();

CREATE OR REPLACE FUNCTION qwat_od.ft_element_hydrant_update()
  RETURNS trigger AS
$BODY$
	BEGIN
		SELECT qwat_od.ft_element_hydrant_delete();
		SELECT qwat_od.ft_element_hydrant_insert();
	END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER tr_element_hydrant_update
  INSTEAD OF UPDATE
  ON qwat_od.vw_element_hydrant
  FOR EACH ROW
  EXECUTE PROCEDURE qwat_od.ft_element_hydrant_update();

