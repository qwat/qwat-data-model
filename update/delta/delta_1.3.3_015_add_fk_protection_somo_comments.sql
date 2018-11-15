UPDATE qwat_vl.pipe_protection SET description_ro = 'SOMO este o marcă dispărută a grupului Bouygues, nefolosită în Ro' WHERE id IN (4302,4304);
UPDATE qwat_vl.pipe_protection SET description_fr = 'SOMO est une ancienne marque disparue du groupe Bouygues qui ne caractérisait pas vraiment un type de tuyau, même si, dans la mémoire collective des années 80-90, cela voulait plutôt désigner, à tort, les tuyaux PE-câbles', description_ro = 'SOMO este o marcă dispărută a grupului Bouygues, nefolosită în Ro' WHERE id = 4310;

COMMENT ON COLUMN qwat_od.cover.form_dimension  IS 'in meters; depending on the cover form, it represents either the diameter of circle or the length of a square side';
