CONNECT / AS SYSDBA

-- Crear database
-- ---------------

-- STARTUP NOMOUNT
CREATE TABLESPACE "TS_PFIRMA_INDICES" DATAFILE '/export/home/app/oradata/pfirma/TS_PFIRMA_INDICES_000001.ora' SIZE 16M AUTOEXTEND ON;
CREATE TABLESPACE "TS_PFIRMA_DATOS" DATAFILE '/export/home/app/oradata/pfirma/TS_PFIRMA_DATOS_000001.ora' SIZE 64M AUTOEXTEND ON;
CREATE TABLESPACE "TS_PFIRMA_BLOB" DATAFILE '/export/home/app/oradata/pfirma/TS_PFIRMA_BLOB_000001.ora' SIZE 128M AUTOEXTEND ON;
