CREATE SEQUENCE qwat_od.surveypoint_id_seq;
ALTER TABLE qwat_od.surveypoint ALTER COLUMN id SET DEFAULT nextval('qwat_od.surveypoint_id_seq'::regclass);
ALTER TABLE qwat_od.surveypoint DROP CONSTRAINT surveypoint_id_fkey;
SELECT setval('qwat_od.surveypoint_id_seq', COALESCE((SELECT max(id)+1 FROM qwat_od.surveypoint), 1), false);
