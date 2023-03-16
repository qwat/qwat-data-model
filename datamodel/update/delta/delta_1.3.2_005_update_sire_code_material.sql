
-- fix code_sire for PE 100
UPDATE qwat_vl.pipe_material SET code_sire = 7 WHERE id >= 7048 AND id <= 7067
