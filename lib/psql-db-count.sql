SELECT COUNT(*)
FROM pg_database
WHERE datname = '%%DBNAME%%';
