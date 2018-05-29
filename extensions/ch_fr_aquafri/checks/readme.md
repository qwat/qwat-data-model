### Manual checkings

Ensure core value lists are ok compared to a reference

Sample : 
```
-- only differencies  
SELECT A.id, A.value_fr, B.id, B.code  
FROM qwat_vl.pipe_function as A  
    FULL JOIN qwat_ch_fr_aquafri.pipe_function AS B ON (A.id = B.id)  
WHERE A.id IS NULL OR B.id IS NULL  

-- get full list  
SELECT A.id, A.value_fr, B.id, B.code  
FROM qwat_vl.pipe_function as A  
    FULL JOIN qwat_ch_fr_aquafri.pipe_function AS B ON (A.id = B.id)  
```

