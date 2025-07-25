grant usage on schema repair to anon,
authenticated,
service_role;

grant all on all tables in schema repair to anon,
authenticated,
service_role;

grant all on all routines in schema repair to anon,
authenticated,
service_role;

grant all on all sequences in schema repair to anon,
authenticated,
service_role;

alter default privileges for role postgres in schema repair
grant all on tables to anon,
authenticated,
service_role;

alter default privileges for role postgres in schema repair
grant all on routines to anon,
authenticated,
service_role;

alter default privileges for role postgres in schema repair
grant all on sequences to anon,
authenticated,
service_role;
