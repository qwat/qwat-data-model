

/*        
Creates the fields and constraints for customization of labels.
*/

CREATE OR REPLACE FUNCTION qwat_od.fn_label_create_fields(_tbl text, _position bool = true, _rotation bool = true)
  RETURNS void AS
$func$
BEGIN
    /* Creates columns */
   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_visible smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_x double precision default null
         , ADD COLUMN label_1_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_1_rotation double precision default null' , _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_1_text varchar(120)    
         , ADD COLUMN label_2_visible  smallint default 1', _tbl);

   IF _position THEN
       EXECUTE format('ALTER TABLE qwat_od.%I
           ADD COLUMN label_2_x double precision default null
         , ADD COLUMN label_2_y double precision default null', _tbl);
   END IF;
   IF _rotation THEN
       EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_rotation double precision default null', _tbl);
   END IF;

   EXECUTE format('ALTER TABLE qwat_od.%I ADD COLUMN label_2_text varchar(120)', _tbl);

   /* Creates constraints */
   EXECUTE format('ALTER TABLE qwat_od.%1$I
           ADD CONSTRAINT %2$I FOREIGN KEY (label_1_visible) REFERENCES qwat_vl.visible(vl_code_int)
         , ADD CONSTRAINT %3$I FOREIGN KEY (label_2_visible) REFERENCES qwat_vl.visible(vl_code_int);
     CREATE INDEX %4$I ON qwat_od.%1$I(label_1_visible);
     CREATE INDEX %5$I ON qwat_od.%1$I(label_2_visible)'
   , _tbl
   , _tbl || '_label_1_visible'
   , _tbl || '_label_2_visible'
   , 'fki_' || _tbl || '_label_1_visible'
   , 'fki_' || _tbl || '_label_2_visible');
END
$func$ LANGUAGE plpgsql;

COMMENT ON FUNCTION qwat_od.fn_label_create_fields(text, boolean, boolean) IS 'Creates the fields and constraints for customization of labels.';

