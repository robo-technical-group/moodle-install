SELECT COUNT(*)
FROM pg_roles
WHERE rolname = '%%DBUSER%%';
