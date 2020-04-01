-- ***************************************************
-- **          PROYECTO WEB BASE                    **
-- **          REV:26\01\2019                       ** 
-- ***************************************************

--
-- PostgreSQL database dump
--

-- Database: JUEGOHACKER_BD

CREATE DATABASE "OWNK_BD"
    WITH 
    OWNER = ownk_us    
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
grant all privileges on database "OWNK_BD" TO ownk_us;

--Se ajusta path para creacion en el schema
ALTER DATABASE "OWNK_BD" SET search_path TO ownk_schema,public;
SET search_path TO ownk_schema,public;

	
-- Cambio de base de datos
\c "OWNK_BD" 



create extension pgcrypto;
create extension "uuid-ossp";
create extension pg_trgm;

--
-- Name: ownk_ext; Type: SCHEMA; Schema: -; Owner: ownk_us
--

CREATE SCHEMA ownk_ext;


ALTER SCHEMA ownk_ext OWNER TO ownk_us;


CREATE SCHEMA ownk_schema;

ALTER SCHEMA ownk_schema OWNER TO ownk_us;

