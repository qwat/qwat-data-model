DO
$DO$
DECLARE
	rel_record record;
	is_table boolean;
BEGIN
	FOR rel_record  in
		SELECT
			split_part(relation_name, '.', 1) as schm,
			split_part(relation_name, '.', 2) as rel,
			uid_column FROM tww_sys.logged_relations
	LOOP
		SELECT EXISTS (
            SELECT 1
            FROM pg_tables
            WHERE schemaname = rel_record.schm
            AND tablename = rel_record.rel
        ) INTO is_table;
		IF is_table THEN
            EXECUTE FORMAT( 'SELECT qwat_app.audit_table(''%I.%I'')', rel_record.schm, rel_record.rel);
            -- Do something for tables
        ELSE
            EXECUTE
				FORMAT( 'SELECT qwat_app.audit_view(''%I.%I'', true, ''{{}}''::text[], ''{{%I}}''::text[])'
				, rel_record.schm
				, rel_record.rel
				, rel_record.uid_column);
            -- Do something for views
        END IF;

	END LOOP;
END;
$DO$;
