/*
This adds corresponding german translated values for QWAT.
*/

-- Add columns
ALTER TABLE qwat_vl.value_list_base ADD COLUMN short_de varchar(10) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN value_de varchar(50) ;
ALTER TABLE qwat_vl.value_list_base ADD COLUMN description_de text ;


-- Populate columns

-- To be determined