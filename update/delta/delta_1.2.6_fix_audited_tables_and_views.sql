DO $$
BEGIN

PERFORM qwat_sys.audit_table('qwat_od.distributor');
PERFORM qwat_sys.audit_table('qwat_od.district');
PERFORM qwat_sys.audit_table('qwat_od.folder');
PERFORM qwat_sys.audit_table('qwat_od.leak');
PERFORM qwat_sys.audit_table('qwat_od.pipe');
PERFORM qwat_sys.audit_table('qwat_od.protectionzone');
PERFORM qwat_sys.audit_table('qwat_od.remote');
PERFORM qwat_sys.audit_table('qwat_od.surveypoint');
PERFORM qwat_sys.audit_table('qwat_od.printmap');

UPDATE qwat_sys.versions SET version = '1.2.6';

END
$$;