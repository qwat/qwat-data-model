



CREATE AGGREGATE qwat_sys.array_accum (anyelement)
(
sfunc = array_append,
stype = anyarray,
initcond = '{}'
);
