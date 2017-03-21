ALTER TABLE qwat_od.printmap add column print_scale SMALLINT;

UPDATE qwat_sys.versions SET version = '1.2.2';
