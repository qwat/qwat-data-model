/* create a view with ordered materials */
DROP VIEW IF EXISTS qwat_vl.vw_pipe_material CASCADE;
CREATE OR REPLACE VIEW qwat_vl.vw_pipe_material AS 
 SELECT *
   FROM qwat_vl.pipe_material
  ORDER BY _displayname_fr;
