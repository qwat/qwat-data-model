DO $$
BEGIN

    -- before 1.3.2 deactivate_audit_tables did not exist, so we test that the function
    -- exists prior to calling it

    IF EXISTS (SELECT 1
               FROM pg_proc pp JOIN pg_namespace pn ON (pp.pronamespace = pn.oid)
               WHERE pp.proname='deactivate_audit_tables' AND pn.nspname='qwat_sys') THEN
        PERFORM qwat_sys.deactivate_audit_tables();
    END IF;

END
$$
