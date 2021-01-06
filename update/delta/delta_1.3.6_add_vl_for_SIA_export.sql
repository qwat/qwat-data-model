ALTER TABLE qwat_vl.pipe_material ADD COLUMN sia_de text not null default 'unbekannt'; 
ALTER TABLE qwat_vl.pipe_material ADD COLUMN sia_fr text not null default 'inconnu';

UPDATE qwat_vl.pipe_material SET sia_de = 'Polyethylen', sia_fr = 'polyethylene' WHERE short_fr = 'PE';
