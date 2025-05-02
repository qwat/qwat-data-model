/* Drop defaults for marked and underground hydrant fields */

ALTER TABLE qwat_od.hydrant ALTER COLUMN underground DROP DEFAULT;
ALTER TABLE qwat_od.hydrant ALTER COLUMN marked DROP DEFAULT;
