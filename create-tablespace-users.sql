-- Creating tablespaces
CREATE TABLESPACE SQL3_TBS DATAFILE 'SQL3_TBS.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M;
CREATE TEMPORARY TABLESPACE SQL3_TempTBS TEMPFILE 'SQL3_TempTBS.dbf' SIZE 50M AUTOEXTEND ON NEXT 5M;

-- Creating user and assigning tablespaces
CREATE USER SQL3 IDENTIFIED BY password
  DEFAULT TABLESPACE SQL3_TBS
  TEMPORARY TABLESPACE SQL3_TempTBS;

-- Granting privileges
GRANT CONNECT, RESOURCE, DBA TO SQL3;