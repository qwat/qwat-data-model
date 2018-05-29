
SELECT A.id, A.value_fr, B.id, B.code
FROM qwat_vl.pipe_material as A
    FULL JOIN qwat_ch_fr_aquafri.pipe_material AS B ON (A.id = B.id)
WHERE A.id IS NULL OR B.id IS NULL