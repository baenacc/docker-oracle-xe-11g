------------------------------------------------------
-- Punto 3.5. del Manual "Creación de permisos para el usuario de la aplicación" --
------------------------------------------------------
-- El usuario propietario debe concederle permisos de SELECT, INSERT, DELETE, UPDATE sobre todos los objetos tabla, 
-- así como SELECT sobre todos los objetos secuencia. Deberá de crear además un sinónimo privado por cada objeto del esquema del propietario. 
-- En principio no deben hacerse sinónimos públicos sobre los objetos del Histórico dado que esto puede dar la sensación de que se pueda 
-- acceder a los mismos, es mejor por motivos de seguridad solo hacer sinónimos privados a nivel de usuario web.

-- Concede permisos al usuario de aplicación PFIRMAWEBHIST para realizar SELECT, INSERT, DELETE y UPDATE sobre todas las tablas propiedad de PFIRMAMGHIST
BEGIN
   FOR R IN (SELECT OWNER, TABLE_NAME FROM ALL_TABLES WHERE OWNER='PFIRMAMGHIST') 
   LOOP
      EXECUTE IMMEDIATE 'GRANT SELECT ON '||R.OWNER||'.'||R.TABLE_NAME||' TO PFIRMAWEBHIST';
	  EXECUTE IMMEDIATE 'GRANT INSERT ON '||R.OWNER||'.'||R.TABLE_NAME||' TO PFIRMAWEBHIST';
	  EXECUTE IMMEDIATE 'GRANT DELETE ON '||R.OWNER||'.'||R.TABLE_NAME||' TO PFIRMAWEBHIST';
      EXECUTE IMMEDIATE 'GRANT UPDATE ON '||R.OWNER||'.'||R.TABLE_NAME||' TO PFIRMAWEBHIST';
   END LOOP;
END;
/
COMMIT;

-- Concede permisos al usuario de aplicación PFIRMAWEBHIST para realizar SELECT sobre todas las secuencias propiedad de PFIRMAMGHIST
BEGIN
   FOR R IN (SELECT SEQUENCE_OWNER, SEQUENCE_NAME FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER='PFIRMAMGHIST') 
   LOOP
      EXECUTE IMMEDIATE 'GRANT SELECT ON '||R.SEQUENCE_OWNER||'.'||R.SEQUENCE_NAME||' TO PFIRMAWEBHIST';
   END LOOP;
END;
/
COMMIT;

---------------------------------
-- ¡¡EJECUTAR con PFIRMAWEBHIST!! --
---------------------------------

CONNECT PFIRMAWEBHIST/PFIRMAWEBHIST;

-- Creacaión de sinónimos para las tablas de PFIRMAWEBHIST
BEGIN
   FOR R IN (SELECT OWNER, TABLE_NAME FROM ALL_TABLES WHERE OWNER='PFIRMAMGHIST') 
   LOOP
      EXECUTE IMMEDIATE 'CREATE SYNONYM '||R.TABLE_NAME||' FOR '||R.OWNER||'.'||R.TABLE_NAME;
   END LOOP;
END;
/
COMMIT;

-- Creación de sinónimos para las secuencias de PFIRMAWEBHIST
BEGIN
   FOR R IN (SELECT SEQUENCE_OWNER, SEQUENCE_NAME FROM ALL_SEQUENCES WHERE SEQUENCE_OWNER='PFIRMAMGHIST')  
   LOOP
      EXECUTE IMMEDIATE 'CREATE SYNONYM '||R.SEQUENCE_NAME||' FOR '||R.SEQUENCE_OWNER||'.'||R.SEQUENCE_NAME;
   END LOOP;
END;
/
COMMIT;

-- Creación de sinónimos para los índices de PFIRMAWEBHIST
BEGIN
   FOR R IN (SELECT OWNER, INDEX_NAME FROM ALL_INDEXES WHERE OWNER='PFIRMAMGHIST') 
   LOOP
      EXECUTE IMMEDIATE 'CREATE SYNONYM '||R.INDEX_NAME||' FOR '||R.OWNER||'.'||R.INDEX_NAME;
   END LOOP;
END;
/
COMMIT;
