CREATE ROLE %%DBUSER%%
WITH LOGIN
NOSUPERUSER INHERIT CREATEDB NOCREATEROLE NOREPLICATION
PASSWORD '%%DBPASS%%'
;
