SELECT COUNT(*)
FROM pg_tables
WHERE schemaname = '%%DBNAME%%';
