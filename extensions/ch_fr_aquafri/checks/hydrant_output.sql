

SELECT A.id, A.value_fr, B.id, B.code
FROM qwat_vl.hydrant_output as A
    FULL JOIN qwat_ch_fr_aquafri.hydrant_output AS B ON (A.id = B.id)
WHERE A.id IS NULL OR B.id IS NULL