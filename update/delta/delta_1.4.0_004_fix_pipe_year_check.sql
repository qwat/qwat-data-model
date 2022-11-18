ALTER TABLE qwat_od.pipe DROP CONSTRAINT pipe_year_check ;

ALTER TABLE qwat_od.pipe ADD CONSTRAINT pipe_year_check CHECK (year IS NULL OR year >= 1800 AND (year <= EXTRACT(YEAR FROM NOW()) OR fk_status = 1306 AND year - 50 <= EXTRACT(YEAR FROM NOW())));