/*
** ----------------------------------------------------------------------------
** script to drop all objects in the database
** --------------------------------------------------------------------------*/

-- Tables 
DROP TABLE updates purge;
DROP TABLE submits purge;
DROP TABLE works_on purge;
DROP TABLE bug_report purge;
DROP TABLE bug purge;
DROP TABLE engineer_assignReport purge;
DROP TABLE engineer_assignProject purge;
DROP TABLE manages purge;
DROP TABLE manager purge;
DROP TABLE project purge;
DROP TABLE engineer CASCADE CONSTRAINTS purge;
