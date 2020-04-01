-- ***************************************************
-- **          PROYECTO WEB BASE                    **
-- **          REV:26\01\2019                       ** 
-- ***************************************************

-- USUARIO DEL APLICATIVO 
-- User: ownk_us

CREATE USER ownk_us WITH
  LOGIN
  ENCRYPTED PASSWORD 'ownk_us'
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

