SELECT A.id, A.value_fr, B.id, B.code
FROM qwat_vl.valve_function as A
    FULL JOIN qwat_ch_fr_aquafri.valve_function AS B ON (A.id = B.id)
WHERE A.id IS NULL OR B.id IS NULL