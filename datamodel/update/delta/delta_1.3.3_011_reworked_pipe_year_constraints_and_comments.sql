ALTER TABLE qwat_od.pipe DROP CONSTRAINT pipe_year_check;
ALTER TABLE qwat_od.pipe DROP CONSTRAINT pipe_year_end_check;
ALTER TABLE qwat_od.pipe DROP CONSTRAINT pipe_year_rehabilitation_check;

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_check CHECK (year IS NULL OR year > 1800 AND (year <= EXTRACT(YEAR FROM NOW()) OR fk_status = 1306 AND year - 50 <= EXTRACT(YEAR FROM NOW())));
COMMENT ON CONSTRAINT pipe_year_check ON qwat_od.pipe IS 'Year when the pipe was installed should be either NULL - not filled OR between 1800 and the current year; if the pipe has the project status (fk_status = 1306) then the year can be between 1800 and 50 years from now';

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_rehabilitation_check CHECK (year_rehabilitation IS NULL OR year_rehabilitation > 1800 AND year_rehabilitation <= EXTRACT(YEAR FROM NOW()));
COMMENT ON CONSTRAINT pipe_year_rehabilitation_check ON qwat_od.pipe IS 'Pipe rehabilitation year should be between 1800 and the current year or NULL/not filled';

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_end_check CHECK (year_end IS NULL OR year_end > 1800 AND year_end <= EXTRACT(YEAR FROM NOW()));
COMMENT ON CONSTRAINT pipe_year_end_check ON qwat_od.pipe IS 'Year when the pipe was shut down should be between 1800 and the current year or NULL/not fill';

COMMENT ON COLUMN qwat_od.pipe.year IS 'Represents the year when the pipe was installed. It can be NULL (not filled), between 1800 and the current year. If the pipe has project status then the maximum value of the year can be 50 years from the current year.';
COMMENT ON COLUMN qwat_od.pipe.year_rehabilitation IS 'Represents the year when the pipe was rehabilitated. It can be NULL (not filled) or between 1800 and the current year.';
COMMENT ON COLUMN qwat_od.pipe.year_end IS 'Represents the year when the pipe was shut down. It can be NULL (not filled) or between 1800 and the current year.';

