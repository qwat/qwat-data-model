SELECT A.id, A.value_fr, B.id, B.code
FROM qwat_vl.remote_type as A
    FULL JOIN qwat_ch_fr_aquafri.remote_type AS B ON (A.id = B.id)
WHERE A.id IS NULL OR B.id IS NULL