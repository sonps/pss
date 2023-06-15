CREATE USER pss SUPERUSER;
ALTER USER pss WITH PASSWORD '';
create database pss_db with owner pss encoding 'UTF8';
