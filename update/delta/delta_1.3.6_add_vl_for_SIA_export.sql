ALTER TABLE qwat_vl.pipe_material ADD COLUMN sia405_de text not null default 'unbekannt';

-- UPDATE qwat_vl.pipe_material SET sia405_de = 'Polyethylen' WHERE short_fr = 'PE';
-- UPDATE qwat_vl.pipe_material SET sia405_de = 'Stahl' WHERE short_fr = 'AC';
