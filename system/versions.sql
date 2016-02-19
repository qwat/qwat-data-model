
/*
 creates a table to save qWAT versions and extra modules versions
*/


CREATE TABLE qwat_sys.versions
(
   id serial,
   module varchar,
   version varchar,
   constraint versions_pkey primary key(id),
   constraint module_unique unique(module),
);

/*
Create a type and function to extract information from varchar version 
A semver.org version string has the following form :
major.minor.patch-prerelease+metadata
e.g :
1.0.0-alpha+exp.sha.5114f85

Usage : 
select * from version_dump('1.0.6-1+build-623');
select (version_dump('1.0.6-1+build-623')).*;
select (version_dump('1.0.6-1+build-623')).major;
*/
create type version_result as (
    version_short varchar
    , major int
    , minor int
    , patch int
    , prerelease varchar
    , metadata varchar
);

create or replace function version_dump(version varchar) returns version_result as $$
select 
    a[1], a[2]::int, a[3]::int, a[4]::int, a[5], a[6] 
from 
    regexp_matches(version, '^v?((\d+)\.(\d+)\.(\d+))(?:-([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?(?:\+([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?$') as a
$$ language SQL;

