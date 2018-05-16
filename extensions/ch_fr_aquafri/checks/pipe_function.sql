
/*
-- return missing id only
SELECT A.id, B.id
FROM qwat_vl.pipe_function as A
    FULL JOIN qwat_ch_fr_aquafri.pipe_function AS B ON (A.id = B.id)
WHERE A.id IS NULL OR B.id IS NULL
*/

/*
-- get full list
SELECT A.id, A.value_fr, B.id, B.code
FROM qwat_vl.pipe_function as A
    FULL JOIN qwat_ch_fr_aquafri.pipe_function AS B ON (A.id = B.id)
-- WHERE A.id IS NULL OR B.id IS NULL
*/

SELECT A.id, A.value_fr, B.id, B.code
FROM qwat_vl.pipe_function as A
    FULL JOIN qwat_ch_fr_aquafri.pipe_function AS B ON (A.id = B.id)
WHERE A.id IS NULL OR B.id IS NULL