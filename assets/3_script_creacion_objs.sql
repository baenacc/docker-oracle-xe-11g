--  Create Tables 
CREATE TABLE PF_ACCIONES
(
	X_ACCION         NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO     VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO     DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	T_ACCION         VARCHAR2(4000 CHAR) NOT NULL,    --  Accion a ejecutar 
	C_TIPO           VARCHAR2(10 CHAR) DEFAULT 'PLSQL' NOT NULL,    --  Tipo de accion ('PLSQL','WEB') 
	DOC_X_DOCUMENTO  NUMBER(10),    --  Clave ajena a PF_DOCUMENTOS 
	PET_X_PETICION   NUMBER(10),    --  Clave ajena a PF_PETICIONES 
	ETIQ_X_ETIQUETA  NUMBER(10) NOT NULL    --  Clave ajena a PF_ETIQUETAS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_ACCIONES IS 'Acciones asociadas a documentos y estados'
;
COMMENT ON COLUMN PF_ACCIONES.X_ACCION         IS 'Clave primaria'
;
COMMENT ON COLUMN PF_ACCIONES.C_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCIONES.F_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCIONES.C_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCIONES.F_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCIONES.T_ACCION         IS 'Accion a ejecutar'
;
COMMENT ON COLUMN PF_ACCIONES.C_TIPO           IS 'Tipo de accion (''PLSQL'',''WEB'')'
;
COMMENT ON COLUMN PF_ACCIONES.DOC_X_DOCUMENTO  IS 'Clave ajena a PF_DOCUMENTOS'
;
COMMENT ON COLUMN PF_ACCIONES.PET_X_PETICION   IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_ACCIONES.ETIQ_X_ETIQUETA  IS 'Clave ajena a PF_ETIQUETAS'
;

CREATE TABLE PF_APLICACIONES
(
	X_APLICACION         NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_APLICACION         VARCHAR2(120 CHAR) NOT NULL,    --  Codigo de aplicacion 
	D_APLICACION         VARCHAR2(255 CHAR),    --  Descripcion de aplicacion	
	APL_X_APLICACION     NUMBER(10),    --  Clave ajena a PF_APLICACIONES 
	CON_X_CONFIGURACION  NUMBER(10) NOT NULL    --  Clave ajena a PF_CONFIGURACIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_APLICACIONES.X_APLICACION         IS 'Clave primaria'
;
COMMENT ON COLUMN PF_APLICACIONES.C_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES.F_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES.C_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES.F_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES.C_APLICACION         IS 'Codigo de aplicacion'
;
COMMENT ON COLUMN PF_APLICACIONES.D_APLICACION         IS 'Descripcion de aplicacion'
;
COMMENT ON COLUMN PF_APLICACIONES.APL_X_APLICACION     IS 'Clave ajena a PF_APLICACIONES'
;
COMMENT ON COLUMN PF_APLICACIONES.CON_X_CONFIGURACION  IS 'Clave ajena a PF_CONFIGURACIONES'
;

CREATE TABLE PF_APLICACIONES_PARAMETRO
(
	X_APLICACION_PARAMETRO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	T_VALOR                   VARCHAR2(1000 CHAR) NOT NULL,    --  Valor del parametro para esa aplicacion 
	PAR_X_PARAMETRO           NUMBER(10) NOT NULL,    --  Clave ajena a PF_PARAMETROS 
	APL_X_APLICACION          NUMBER(10) NOT NULL    --  Clave ajena a PF_APLICACIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_APLICACIONES_PARAMETRO IS 'Tabla que almacena los valores de los parametros de las aplicaciones'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.X_APLICACION_PARAMETRO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.C_CREADO                  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.F_CREADO                  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.C_MODIFICADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.F_MODIFICADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.T_VALOR                   IS 'Valor del parametro para esa aplicacion'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.PAR_X_PARAMETRO           IS 'Clave ajena a PF_PARAMETROS'
;
COMMENT ON COLUMN PF_APLICACIONES_PARAMETRO.APL_X_APLICACION          IS 'Clave ajena a PF_APLICACIONES'
;

CREATE TABLE PF_ARCHIVOS
(
	X_ARCHIVO      NUMBER(10) NOT NULL,    -- Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_HASH         VARCHAR2(512) NOT NULL,    -- Identificador unico de archivo 
	C_HASH_ALG     VARCHAR2(10 CHAR) NOT NULL,    -- Algoritmo de generacion del hash 
	C_TIPO         VARCHAR2(10 CHAR) NOT NULL,    -- Tipo de almacenamiento 
	C_URI          VARCHAR2(1000 CHAR),    -- Identificador de almacenamiento 
	B_ARCHIVO      BLOB,    -- Binario del fichero 
	T_COMENTARIOS  VARCHAR2(1000 CHAR),    -- Comentarios adicionales al fichero 
	ARC_X_ARCHIVO  NUMBER(10)    -- Clave ajena a PF_ARCHIVOS 
)
TABLESPACE  TS_PFIRMA_DATOS
LOB (B_ARCHIVO) STORE AS (TABLESPACE TS_PFIRMA_BLOB)
;

COMMENT ON TABLE PF_ARCHIVOS IS 'Archivos'
;
COMMENT ON COLUMN PF_ARCHIVOS.X_ARCHIVO      IS 'Clave primaria'
;
COMMENT ON COLUMN PF_ARCHIVOS.C_CREADO       IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ARCHIVOS.F_CREADO       IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ARCHIVOS.C_MODIFICADO   IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ARCHIVOS.F_MODIFICADO   IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ARCHIVOS.C_HASH         IS 'Identificador unico de archivo'
;
COMMENT ON COLUMN PF_ARCHIVOS.C_HASH_ALG     IS 'Algoritmo de generacion del hash'
;
COMMENT ON COLUMN PF_ARCHIVOS.C_TIPO         IS 'Tipo de almacenamiento'
;
COMMENT ON COLUMN PF_ARCHIVOS.C_URI          IS 'Identificador de almacenamiento'
;
COMMENT ON COLUMN PF_ARCHIVOS.B_ARCHIVO      IS 'Binario del fichero'
;
COMMENT ON COLUMN PF_ARCHIVOS.T_COMENTARIOS  IS 'Comentarios adicionales al fichero'
;
COMMENT ON COLUMN PF_ARCHIVOS.ARC_X_ARCHIVO  IS 'Clave ajena a PF_ARCHIVOS'
;


CREATE TABLE PF_BLOQUES
(
	X_BLOQUE       NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_HASH         VARCHAR2(10) NOT NULL,    --  Identificador de bloque 
	C_TRANSACCION  VARCHAR2(255 CHAR),    --  Identificador de la transaccion 
	F_FIRMA			DATE, -- Fecha de firma del bloque	
	C_APLICACION   VARCHAR2(255 CHAR),    --  Identificador de la aplicacion 
	C_SERVIDOR     VARCHAR2(255 CHAR),    --  Identificador del servidor 
	C_TIPO         VARCHAR2(10 CHAR) DEFAULT 'ID' NOT NULL,    -- Tipo de almacenamiento de la firma 
	C_URI          VARCHAR2(1000 CHAR),    -- Identificador de almacemiento de la firma 
	B_BLOQUE       BLOB,    -- Binario de la firma en bloque
	C_FORMATO	   VARCHAR2(30 CHAR) DEFAULT 'CMS' NOT NULL -- formato de firma	
)
TABLESPACE  TS_PFIRMA_DATOS
LOB (B_BLOQUE) STORE AS (TABLESPACE TS_PFIRMA_BLOB)
;

COMMENT ON COLUMN PF_BLOQUES.X_BLOQUE       IS 'Clave primaria'
;
COMMENT ON COLUMN PF_BLOQUES.C_CREADO       IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_BLOQUES.F_CREADO       IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_BLOQUES.C_MODIFICADO   IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_BLOQUES.F_MODIFICADO   IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_BLOQUES.C_HASH         IS 'Identificador de bloque'
;
COMMENT ON COLUMN PF_BLOQUES.C_TRANSACCION  IS 'Identificador de la transaccion'
;
COMMENT ON COLUMN PF_BLOQUES.C_APLICACION   IS 'Identificador de la aplicacion'
;
COMMENT ON COLUMN PF_BLOQUES.F_FIRMA   IS 'Fecha de firma del bloque'
;
COMMENT ON COLUMN PF_BLOQUES.C_SERVIDOR     IS 'Identificador del servidor'
;
COMMENT ON COLUMN PF_BLOQUES.C_TIPO         IS 'Tipo de almacenamiento de la firma'
;
COMMENT ON COLUMN PF_BLOQUES.C_URI          IS 'Identificador de almacemiento de la firma'
;
COMMENT ON COLUMN PF_BLOQUES.B_BLOQUE       IS 'Binario de la firma en bloque'
;
COMMENT ON COLUMN PF_BLOQUES.C_FORMATO       IS 'Formato de firma CMS/XaDES/CaDES'
;

CREATE TABLE PF_COMENTARIOS
(
	X_COMENTARIO    NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	D_ASUNTO        VARCHAR2(255 CHAR) NOT NULL,    --  Asunto o titulo del comentario 
	T_COMENTARIO    VARCHAR2(1000 CHAR) NOT NULL,    --  Texto del comentario 
	PET_X_PETICION  NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	USU_X_USUARIO   NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_COMENTARIOS IS 'Comentarios a las peticiones'
;
COMMENT ON COLUMN PF_COMENTARIOS.X_COMENTARIO    IS 'Clave primaria'
;
COMMENT ON COLUMN PF_COMENTARIOS.C_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_COMENTARIOS.F_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_COMENTARIOS.C_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_COMENTARIOS.F_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_COMENTARIOS.D_ASUNTO        IS 'Asunto o titulo del comentario'
;
COMMENT ON COLUMN PF_COMENTARIOS.T_COMENTARIO    IS 'Texto del comentario'
;
COMMENT ON COLUMN PF_COMENTARIOS.PET_X_PETICION  IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_COMENTARIOS.USU_X_USUARIO   IS 'Clave ajena a PF_USUARIOS'
;

CREATE TABLE PF_CONFIGURACIONES
(
	X_CONFIGURACION  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria  
	C_CONFIGURACION  VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de configuracion 
	L_PRINCIPAL      VARCHAR2(1 CHAR) NOT NULL,    --  Indica si es la configuracion por defecto 
	SER_X_SERVIDOR   NUMBER(10) NOT NULL    --  Clave ajena a PF_SERVIDORES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_CONFIGURACIONES IS 'Almacena las distintas configuraciones disponibles para cada servidor'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.X_CONFIGURACION  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.C_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.F_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.C_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.F_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.C_CONFIGURACION  IS 'Codigo de configuracion'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.L_PRINCIPAL      IS 'Indica si es la configuracion por defecto'
;
COMMENT ON COLUMN PF_CONFIGURACIONES.SER_X_SERVIDOR   IS 'Clave ajena a PF_SERVIDORES'
;

CREATE TABLE PF_CONFIGURACIONES_PARAMETRO
(
	X_CONFIGURACION_PARAMETRO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	T_VALOR                    VARCHAR2(1000 CHAR) NOT NULL,    --  Valor del parametro 
	PAR_X_PARAMETRO            NUMBER(10) NOT NULL,    --  Clave ajena a PF_PARAMETROS 
	CON_X_CONFIGURACION        NUMBER(10)    --  Clave ajena a PF_CONFIGURACIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_CONFIGURACIONES_PARAMETRO IS 'Valores de los parametros para una configuracion de servidor'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.X_CONFIGURACION_PARAMETRO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.C_CREADO                   IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.F_CREADO                   IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.C_MODIFICADO               IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.T_VALOR                    IS 'Valor del parametro'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.PAR_X_PARAMETRO            IS 'Clave ajena a PF_PARAMETROS'
;
COMMENT ON COLUMN PF_CONFIGURACIONES_PARAMETRO.CON_X_CONFIGURACION        IS 'Clave ajena a PF_CONFIGURACIONES'
;

-- AÃ±adido campo para prefirma

CREATE TABLE PF_DOCUMENTOS
(
	X_DOCUMENTO            NUMBER(10) NOT NULL,    -- Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_HASH                 VARCHAR2(10) NOT NULL,    -- Identificador del documento 
	D_NOMBRE               VARCHAR2(255 CHAR) NOT NULL,    -- Nombre del documento 
	D_MIME                 VARCHAR2(255 CHAR) DEFAULT 'application/octet-stream' NOT NULL,    -- Tipo mime del documento 
	T_COMENTARIOS          VARCHAR2(1000 CHAR),    -- Comentarios 
	L_FIRMABLE             VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,    -- Indica si el documento es firmable o no 
	C_PREFIRMA             VARCHAR2(100 CHAR),    -- Identificador de documento obtenido por prefirma 
	PET_X_PETICION         NUMBER(10) NOT NULL,    -- Clave ajena a PF_PETICIONES 
	TDOC_X_TIPO_DOCUMENTO  NUMBER(10) NOT NULL,    -- Clave ajena a PF_TIPOS_DOCUMENTO 
	ARC_X_ARCHIVO          NUMBER(10) NOT NULL,    -- Clave ajena a PF_ARCHIVOS
	AMB_X_AMBITO           NUMBER(10) DEFAULT 1 NOT NULL,    -- Clave ajena a PF_AMBITOS_DOCUMENTOS 
	L_ES_FIRMA			   VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,-- Indica si el documento en sÃ­ es una firma.
	C_COMENTARIO_ANEXO VARCHAR2(50 CHAR)
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_DOCUMENTOS.X_DOCUMENTO            IS 'Clave primaria'
;
COMMENT ON COLUMN PF_DOCUMENTOS.C_CREADO               IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_DOCUMENTOS.F_CREADO               IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_DOCUMENTOS.C_MODIFICADO           IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_DOCUMENTOS.F_MODIFICADO           IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_DOCUMENTOS.C_HASH                 IS 'Identificador del documento'
;
COMMENT ON COLUMN PF_DOCUMENTOS.D_NOMBRE               IS 'Nombre del documento'
;
COMMENT ON COLUMN PF_DOCUMENTOS.D_MIME                 IS 'Tipo mime del documento'
;
COMMENT ON COLUMN PF_DOCUMENTOS.T_COMENTARIOS          IS 'Comentarios'
;
COMMENT ON COLUMN PF_DOCUMENTOS.L_FIRMABLE             IS 'Indica si el documento es firmable o no'
;
COMMENT ON COLUMN PF_DOCUMENTOS.C_PREFIRMA             IS 'Identificador de documento obtenido por prefirma'
;
COMMENT ON COLUMN PF_DOCUMENTOS.PET_X_PETICION         IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_DOCUMENTOS.TDOC_X_TIPO_DOCUMENTO  IS 'Clave ajena a PF_TIPOS_DOCUMENTO'
;
COMMENT ON COLUMN PF_DOCUMENTOS.ARC_X_ARCHIVO          IS 'Clave ajena a PF_ARCHIVOS'
;
COMMENT ON COLUMN PF_DOCUMENTOS.AMB_X_AMBITO 		   IS 'Clave ajena a PF_AMBITOS_DOCUMENTOS'
;
COMMENT ON COLUMN PF_DOCUMENTOS.L_ES_FIRMA  		   IS 'Indica si el documento en sÃ­ es una firma'
;
COMMENT ON COLUMN PF_DOCUMENTOS.C_COMENTARIO_ANEXO IS 'Indica el comentario para el nuevo anexo'
;

CREATE TABLE PF_ETIQUETAS
(
	X_ETIQUETA    NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_ETIQUETA    VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de etiqueta 
	C_TIPO        VARCHAR2(10 CHAR) NOT NULL    --  Tipo de etiqueta 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_ETIQUETAS.X_ETIQUETA    IS 'Clave primaria'
;
COMMENT ON COLUMN PF_ETIQUETAS.C_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS.F_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS.C_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS.F_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS.C_ETIQUETA    IS 'Codigo de etiqueta'
;
COMMENT ON COLUMN PF_ETIQUETAS.C_TIPO        IS 'Tipo de etiqueta'
;

CREATE TABLE PF_ETIQUETAS_PETICION
(
	X_ETIQUETA_PETICION  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	PET_X_PETICION       NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	USU_X_USUARIO        NUMBER(10),    --  Clave ajena a PF_USUARIOS 
	ETIQ_X_ETIQUETA      NUMBER(10) NOT NULL,    --  Clave ajena a PF_ETIQUETAS
	LFIR_X_LINEA_FIRMA 	 NUMBER(10), 			-- Clave ajena a PF_LINEAS_FIRMA
	C_HASH 				 VARCHAR2(10) -- Hash de etiqueta peticiÃ³n
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_ETIQUETAS_PETICION.X_ETIQUETA_PETICION  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.C_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.F_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.C_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.F_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.PET_X_PETICION       IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.USU_X_USUARIO        IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.ETIQ_X_ETIQUETA      IS 'Clave ajena a PF_ETIQUETAS'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.LFIR_X_LINEA_FIRMA   IS 'Clave ajena a PF_LINEAS_FIRMA'
;
COMMENT ON COLUMN PF_ETIQUETAS_PETICION.C_HASH   IS 'CÃ³digo hash de la etiqueta peticiÃ³n'
;


CREATE TABLE PF_ETIQUETAS_USUARIO
(
	X_ETIQUETA_USUARIO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	USU_X_USUARIO       NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	ETIQ_X_ETIQUETA     NUMBER(10) NOT NULL,    --  Clave ajena a PF_ETIQUETAS 
	C_COLOR				VARCHAR2(30 CHAR) -- Codigo de estilo de la etiqueta
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.X_ETIQUETA_USUARIO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.C_CREADO            IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.F_CREADO            IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.C_MODIFICADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.F_MODIFICADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.USU_X_USUARIO       IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.ETIQ_X_ETIQUETA     IS 'Clave ajena a PF_ETIQUETAS'
;
COMMENT ON COLUMN PF_ETIQUETAS_USUARIO.C_COLOR     IS 'Codigo de estilo de la etiqueta'
;

-- 10/12/2009 Fecha inicio opcional V2.0.0.10

CREATE TABLE PF_FILTROS
(
	X_FILTRO                  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_FILTRO                  VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de filtro 
	F_INICIO                  DATE,    --  Fecha de inicio de vigencia 
	F_FIN                     DATE,    --  Fecha de fin de vigencia 
	L_VALIDO                  VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si el filtro es valido 
	T_MOTIVO                  VARCHAR2(1000 CHAR),    --  Motivo del filtro 
	T_FILTRO_ASUNTO           VARCHAR2(1000 CHAR),    --  Texto de filtro para el asunto de la peticion 
	TAUT_X_TIPO_AUTORIZACION  NUMBER(10) NOT NULL,    --  Clave ajena a PF_TIPOS_AUTORIZACION 
	USU_X_USUARIO             NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	APL_X_APLICACION          NUMBER(10)    --  Clave ajena a PF_APLICACIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_FILTROS IS 'Tabla de filtros de peticiones'
;
COMMENT ON COLUMN PF_FILTROS.X_FILTRO                  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_FILTROS.C_CREADO                  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS.F_CREADO                  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS.C_MODIFICADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS.F_MODIFICADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS.C_FILTRO                  IS 'Codigo de filtro'
;
COMMENT ON COLUMN PF_FILTROS.F_INICIO                  IS 'Fecha de inicio de vigencia'
;
COMMENT ON COLUMN PF_FILTROS.F_FIN                     IS 'Fecha de fin de vigencia'
;
COMMENT ON COLUMN PF_FILTROS.L_VALIDO                  IS 'Indica si el filtro es valido'
;
COMMENT ON COLUMN PF_FILTROS.T_MOTIVO                  IS 'Motivo del filtro'
;
COMMENT ON COLUMN PF_FILTROS.T_FILTRO_ASUNTO           IS 'Texto de filtro para el asunto de la peticion'
;
COMMENT ON COLUMN PF_FILTROS.TAUT_X_TIPO_AUTORIZACION  IS 'Clave ajena a PF_TIPOS_AUTORIZACION'
;
COMMENT ON COLUMN PF_FILTROS.USU_X_USUARIO             IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_FILTROS.APL_X_APLICACION          IS 'Clave ajena a PF_APLICACIONES'
;

CREATE TABLE PF_FILTROS_AUTORIZACION
(
	X_FILTRO_AUTORIZACION        NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	F_INICIO                     DATE NOT NULL,    --  Fecha de inicio de vigencia 
	F_FIN                        DATE,    --  Fecha de fin de vigencia 
	L_VALIDO                     VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si es valido 
	FIL_X_FILTRO                 NUMBER(10) NOT NULL,    --  Clave ajena a PF_FILTROS 
	UAUT_X_USUARIO_AUTORIZACION  NUMBER(10)    --  Clave ajena a PF_USUARIOS_AUTORIZACION 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_FILTROS_AUTORIZACION IS 'Tabla de filtros para las autorizaciones'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.X_FILTRO_AUTORIZACION        IS 'Clave primaria'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.C_CREADO                     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.F_CREADO                     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.C_MODIFICADO                 IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.F_MODIFICADO                 IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.F_INICIO                     IS 'Fecha de inicio de vigencia'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.F_FIN                        IS 'Fecha de fin de vigencia'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.L_VALIDO                     IS 'Indica si es valido'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.FIL_X_FILTRO                 IS 'Clave ajena a PF_FILTROS'
;
COMMENT ON COLUMN PF_FILTROS_AUTORIZACION.UAUT_X_USUARIO_AUTORIZACION  IS 'Clave ajena a PF_USUARIOS_AUTORIZACION'
;

CREATE TABLE PF_FIRMANTES
(
	X_FIRMANTE                  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	USU_X_USUARIO               NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	LFIR_X_LINEA_FIRMA          NUMBER(10) NOT NULL,    --  Clave ajena a PF_LINEAS_FIRMA 
	FIR_X_FIRMANTE              NUMBER(10),    --  Clave ajena a PF_FIRMANTES 
	FAUT_X_FILTRO_AUTORIZACION  NUMBER(10)    --  Clave ajena a PF_FILTROS_ATURORIZACION 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_FIRMANTES IS 'Tabla de firmantes'
;
COMMENT ON COLUMN PF_FIRMANTES.X_FIRMANTE                  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_FIRMANTES.C_CREADO                    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMANTES.F_CREADO                    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMANTES.C_MODIFICADO                IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMANTES.F_MODIFICADO                IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMANTES.USU_X_USUARIO               IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_FIRMANTES.LFIR_X_LINEA_FIRMA          IS 'Clave ajena a PF_LINEAS_FIRMA'
;
COMMENT ON COLUMN PF_FIRMANTES.FIR_X_FIRMANTE              IS 'Clave ajena a PF_FIRMANTES'
;
COMMENT ON COLUMN PF_FIRMANTES.FAUT_X_FILTRO_AUTORIZACION  IS 'Clave ajena a PF_FILTROS_ATURORIZACION'
;

CREATE TABLE PF_FIRMAS
(
	X_FIRMA          NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	F_ESTADO         DATE NOT NULL,    --  Fecha desde la que se encuentra en dicho estado 
	T_OBSERVACIONES  VARCHAR2(1000 CHAR),    --  Observaciones 
	C_TRANSACCION    VARCHAR2(255 CHAR),    --  Identificador de transaccion 
	C_APLICACION     VARCHAR2(255 CHAR),    --  Identificador de aplicacion 
	C_SERVIDOR       VARCHAR2(255 CHAR),    --  Identificador de servidor 
	C_TIPO           VARCHAR2(10 CHAR) DEFAULT 'ID' NOT NULL,    -- Tipo de almacenamiento de la firma 
	C_URI            VARCHAR2(1000 CHAR),    -- Identificador de almacenamiento de la firma 
	B_FIRMA          BLOB,    -- Binario de firma 	
	C_FORMATO		 VARCHAR2(30 CHAR) DEFAULT 'CMS' NOT NULL, -- formato de firma	
	DOC_X_DOCUMENTO  NUMBER(10) NOT NULL,    -- Clave ajena a PF_DOCUMENTOS 
	FIR_X_FIRMANTE   NUMBER(10) NOT NULL,    -- Clave ajena a PF_FIRMANTES 
	USU_X_USUARIO    NUMBER(10) NOT NULL,     -- Clave ajena a PF_USUARIOS
	CSV				 VARCHAR2(32 CHAR),            -- Código seguro de verificaciÃ³n de la firma
	B_INFORME		 BLOB, 					 -- Binario del informe de firma
	F_VALIDO		 DATE,    --  Fecha de validez del cetificado que ha realizado la firma
	B_NORMALIZADO	 BLOB
)
TABLESPACE  TS_PFIRMA_DATOS
LOB (B_FIRMA) STORE AS (TABLESPACE TS_PFIRMA_BLOB)
LOB (B_INFORME) STORE AS (TABLESPACE TS_PFIRMA_BLOB)
;

COMMENT ON TABLE PF_FIRMAS IS 'Firmas'
;
COMMENT ON COLUMN PF_FIRMAS.X_FIRMA          IS 'Clave primaria'
;
COMMENT ON COLUMN PF_FIRMAS.C_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS.F_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS.C_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS.F_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS.F_ESTADO         IS 'Fecha desde la que se encuentra en dicho estado'
;
COMMENT ON COLUMN PF_FIRMAS.T_OBSERVACIONES  IS 'Observaciones'
;
COMMENT ON COLUMN PF_FIRMAS.C_TRANSACCION    IS 'Identificador de transaccion'
;
COMMENT ON COLUMN PF_FIRMAS.C_APLICACION     IS 'Identificador de aplicacion'
;
COMMENT ON COLUMN PF_FIRMAS.C_SERVIDOR       IS 'Identificador de servidor'
;
COMMENT ON COLUMN PF_FIRMAS.C_TIPO           IS 'Tipo de almacenamiento de la firma'
;
COMMENT ON COLUMN PF_FIRMAS.C_URI            IS 'Identificador de almacenamiento de la firma'
;
COMMENT ON COLUMN PF_FIRMAS.B_FIRMA          IS 'Binario de firma'
;
COMMENT ON COLUMN PF_FIRMAS.C_FORMATO        IS 'Formato de la firma CMS/XaDES/CaDES'
;
COMMENT ON COLUMN PF_FIRMAS.DOC_X_DOCUMENTO  IS 'Clave ajena a PF_DOCUMENTOS'
;
COMMENT ON COLUMN PF_FIRMAS.FIR_X_FIRMANTE   IS 'Clave ajena a PF_FIRMANTES'
;
COMMENT ON COLUMN PF_FIRMAS.USU_X_USUARIO    IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_FIRMAS.CSV 			 IS 'CÃ³digo seguro de verificaciÃ³n de la firma'
;

CREATE TABLE PF_FIRMAS_BLOQUE
(
	X_FIRMA_BLOQUE  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	BLQ_X_BLOQUE    NUMBER(10) NOT NULL,    --  Clave ajena a PF_BLOQUES 
	FIRM_X_FIRMA    NUMBER(10) NOT NULL    --  Clave ajena a PF_FIRMAS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_FIRMAS_BLOQUE IS 'Relacion entre firmas y bloques'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.X_FIRMA_BLOQUE  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.C_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.F_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.C_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.F_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.BLQ_X_BLOQUE    IS 'Clave ajena a PF_BLOQUES'
;
COMMENT ON COLUMN PF_FIRMAS_BLOQUE.FIRM_X_FIRMA    IS 'Clave ajena a PF_FIRMAS'
;

CREATE TABLE PF_LINEAS_FIRMA
(
	X_LINEA_FIRMA   NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria  
	C_TIPO 			VARCHAR2(10 CHAR) DEFAULT 'FIRMA' NOT NULL,    -- Tipo de accion (firma o visto bueno) 	
	PET_X_PETICION  NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	LFIR_X_LINEA_FIRMA  NUMBER(10)    --  Clave ajena a PF_LINEAS_FIRMA
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_LINEAS_FIRMA IS 'Lineas de firma'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.X_LINEA_FIRMA   IS 'Clave primaria'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.C_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.F_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.C_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.F_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.PET_X_PETICION  IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.LFIR_X_LINEA_FIRMA  IS 'Clave ajena a PF_LINEAS_FIRMA'
;
COMMENT ON COLUMN PF_LINEAS_FIRMA.C_TIPO IS 'Tipo de accion (firma o visto bueno)'
;


CREATE TABLE PF_PARAMETROS
(
	X_PARAMETRO   NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria  
	C_PARAMETRO   VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de parametro 
	D_PARAMETRO   VARCHAR2(255 CHAR) NOT NULL,    --  Descripcion de parametro 
	C_TIPO        VARCHAR2(10 CHAR) NOT NULL,    --  Tipo de parametro 
	ES_PARAMETRO_GENERAL_ADMIN NUMBER DEFAULT 0,
	SUBTIPO_ADMIN VARCHAR2(20 CHAR) 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PARAMETROS.X_PARAMETRO   IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PARAMETROS.C_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PARAMETROS.F_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PARAMETROS.C_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PARAMETROS.F_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PARAMETROS.C_PARAMETRO   IS 'Codigo de parametro'
;
COMMENT ON COLUMN PF_PARAMETROS.D_PARAMETRO   IS 'Descripcion de parametro'
;
COMMENT ON COLUMN PF_PARAMETROS.C_TIPO        IS 'Tipo de parametro'
;
COMMENT ON COLUMN PF_PARAMETROS.ES_PARAMETRO_GENERAL_ADMIN IS 'Define si es un parametro de los que sale en la pantalla general de administracion, 0 es falso, 1 es verdadero'
;
COMMENT ON COLUMN PF_PARAMETROS.SUBTIPO_ADMIN IS 'Define el subtipo de parametro para la pantalla de parametros generales'
;

CREATE TABLE PF_PERFILES
(
	X_PERFIL      NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_PERFIL      VARCHAR2(10 CHAR) NOT NULL,    --  Codigo de perfil 
	D_PERFIL      VARCHAR2(255 CHAR) NOT NULL    --  Descripcion de perfil 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PERFILES.X_PERFIL      IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PERFILES.C_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PERFILES.F_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PERFILES.C_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PERFILES.F_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PERFILES.C_PERFIL      IS 'Codigo de perfil'
;
COMMENT ON COLUMN PF_PERFILES.D_PERFIL      IS 'Descripcion de perfil'
;

CREATE TABLE PF_PETICIONES
(
	X_PETICION               NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_HASH                   VARCHAR2(10) NOT NULL,    --  Codigo de la peticion 
	F_ENTRADA                DATE NOT NULL,    --  Fecha de alta de le peticion 
	F_INICIO                 DATE,    --  Fecha de inicio 
	F_CADUCIDAD              DATE,    --  Fecha de caducidad 
	D_REFERENCIA             VARCHAR2(30 CHAR),    --  Referencia de la peticion 
	D_ASUNTO                 VARCHAR2(255 CHAR),    --  Asunto 
	L_FIRMA_EN_CASCADA       VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si se trata de firma en cascada 
	L_FIRMA_PRIMER_FIRMANTE  VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si se trata de firma de primer firmante 
	T_PETICION               CLOB,    --  Texto de la peticion 
	APL_X_APLICACION         NUMBER(10) NOT NULL,    -- Clave ajena a PF_APLICACIONES
	NV_IMP_X_IMPORTANCIA	 NUMBER(10) NOT NULL,
	L_SELLO_TIEMPO			 VARCHAR2(1 CHAR) DEFAULT 'X' NOT NULL,-- Indica si la peticiÃ³n debe firmarse con sello de tiempo.
	L_SOLO_NOTIF_ACC_REMITE  CHAR(1) DEFAULT 'N' NOT NULL, -- Indica si sÃ³lo se debe notificar al remitente de la peticiÃ³n 
	FECHA_INTENTO_FIRMA TIMESTAMP,
	l_invited varchar2(1) default 'N'  NULL,
    l_accepted varchar2(1) default 'N'  NOT NULL,
	usu_x_usu_inv number(10,0) NULL	
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_PETICIONES IS 'Tabla de peticiones'
;
COMMENT ON COLUMN PF_PETICIONES.X_PETICION               IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PETICIONES.C_CREADO                 IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES.F_CREADO                 IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES.C_MODIFICADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES.F_MODIFICADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES.C_HASH                   IS 'Codigo de la peticion'
;
COMMENT ON COLUMN PF_PETICIONES.F_ENTRADA                IS 'Fecha de alta de le peticion'
;
COMMENT ON COLUMN PF_PETICIONES.F_INICIO                 IS 'Fecha de inicio'
;
COMMENT ON COLUMN PF_PETICIONES.F_CADUCIDAD              IS 'Fecha de caducidad'
;
COMMENT ON COLUMN PF_PETICIONES.D_REFERENCIA             IS 'Referencia de la peticion'
;
COMMENT ON COLUMN PF_PETICIONES.D_ASUNTO                 IS 'Asunto'
;
COMMENT ON COLUMN PF_PETICIONES.L_FIRMA_EN_CASCADA       IS 'Indica si se trata de firma en cascada'
;
COMMENT ON COLUMN PF_PETICIONES.L_FIRMA_PRIMER_FIRMANTE  IS 'Indica si se trata de firma de primer firmante'
;
COMMENT ON COLUMN PF_PETICIONES.T_PETICION               IS 'Texto de la peticion'
;
COMMENT ON COLUMN PF_PETICIONES.APL_X_APLICACION         IS 'Clave ajena a PF_APLICACIONES'
;
COMMENT ON COLUMN PF_PETICIONES.L_SELLO_TIEMPO			 IS 'Indica si las firmas de la peticion llevaran sello de tiempo o no'
;
COMMENT ON COLUMN PF_PETICIONES.L_SOLO_NOTIF_ACC_REMITE	 IS 'Indica si las acciones solamente se notifican al remitente de la peticion'
;
COMMENT ON COLUMN PF_PETICIONES.FECHA_INTENTO_FIRMA IS 'Tiene la fecha exacta en que se inicio el ultimo proceso de firmado, para evitar firmas simultaneas'
;
COMMENT ON COLUMN pf_PETICIONES.l_invited IS 'Indica si la petición es de invitación'
;
COMMENT ON COLUMN pf_PETICIONES.l_accepted IS 'Indica si la petición de invitación ha sido ya aceptada'
;
COMMENT ON COLUMN pf_PETICIONES.usu_x_usu_inv IS 'Usuario invitado'
;

CREATE TABLE PF_PETICIONES_AVISO
(
	X_PETICION_AVISO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	PET_X_PETICION    NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	ETIQ_X_ETIQUETA   NUMBER(10) NOT NULL    --  Clave ajena a PF_ETIQUETAS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_PETICIONES_AVISO IS 'Avisos relacionados con peticiones'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.X_PETICION_AVISO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.C_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.F_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.C_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.F_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.PET_X_PETICION    IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_PETICIONES_AVISO.ETIQ_X_ETIQUETA   IS 'Clave ajena a PF_ETIQUETAS'
;

CREATE TABLE PF_PETICIONES_HISTORICO
(
	X_PETICION_HISTORICO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_PETICION_HISTORICO  VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de texto de historico 
	T_PETICION_HISTORICO  VARCHAR2(1000 CHAR),    --  Descripcion de texto de historico 
	PET_X_PETICION        NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	USU_X_USUARIO         NUMBER(10)    -- Clave ajena a PF_USUARIOS 	
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PETICIONES_HISTORICO.X_PETICION_HISTORICO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.C_CREADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.F_CREADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.C_MODIFICADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.F_MODIFICADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.C_PETICION_HISTORICO  IS 'Codigo de texto de historico'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.T_PETICION_HISTORICO  IS 'Descripcion de texto de historico'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.PET_X_PETICION        IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_PETICIONES_HISTORICO.USU_X_USUARIO         IS 'Clave ajena a PF_USUARIOS'
;

CREATE TABLE PF_PETICIONES_INFORMACION
(
	X_PETICION_INFORMACION  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_INFORMACION           VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de informacion adicional de la peticion 
	D_INFORMACION           VARCHAR2(255 CHAR),    --  Descripcion de informacion adicional 
	L_VISIBLE               VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,    --  ï¿½Visible desde la bandeja de peticiones? 
	L_OBLIGATORIO           VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,    --  ï¿½Obligatorio? 
	L_VIGENTE               VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,    --  ï¿½Vigente? 
	N_ORDEN                 NUMBER(2) DEFAULT 0 NOT NULL,    --  Orden de presentacion de la informacion 
	APL_X_APLICACION        NUMBER(10) NOT NULL    --  Clave ajena a PF_APLICACIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PETICIONES_INFORMACION.X_PETICION_INFORMACION  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.C_CREADO                IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.F_CREADO                IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.C_MODIFICADO            IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.F_MODIFICADO            IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.C_INFORMACION           IS 'Codigo de informacion adicional de la peticion'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.D_INFORMACION           IS 'Descripcion de informacion adicional'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.L_VISIBLE               IS 'ï¿½Visible desde la bandeja de peticiones?'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.L_OBLIGATORIO           IS 'ï¿½Obligatorio?'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.L_VIGENTE               IS 'ï¿½Vigente?'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.N_ORDEN                 IS 'Orden de presentacion de la informacion'
;
COMMENT ON COLUMN PF_PETICIONES_INFORMACION.APL_X_APLICACION        IS 'Clave ajena a PF_APLICACIONES'
;

CREATE TABLE PF_PETICIONES_VALOR
(
	X_PETICION_VALOR  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	T_VALOR           VARCHAR2(1000 CHAR) NOT NULL,    --  Valor de la informacion 
	PEIN_X_PETICION_INFORMACION   NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES_VALOR 
	PET_X_PETICION   NUMBER(10) NOT NULL    --  Clave ajena a PF_PETICIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PETICIONES_VALOR.X_PETICION_VALOR  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.C_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.F_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.C_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.F_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.T_VALOR           IS 'Valor de la informacion'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.PEIN_X_PETICION_INFORMACION   IS 'Clave ajena a PF_PETICIONES_VALOR'
;
COMMENT ON COLUMN PF_PETICIONES_VALOR.PET_X_PETICION   IS 'Clave ajena a PF_PETICIONES'
;

CREATE TABLE PF_SERVIDORES
(
	X_SERVIDOR    NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_SERVIDOR    VARCHAR2(10 CHAR) NOT NULL,    --  Codigo de servidor 
	D_SERVIDOR    VARCHAR2(50 CHAR) NOT NULL,    --  Descripcion de servidor 
	L_PRINCIPAL   VARCHAR2(1 CHAR) NOT NULL    --  Indica si es el servidor por defecto 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_SERVIDORES IS 'Servidores de firma'
;
COMMENT ON COLUMN PF_SERVIDORES.X_SERVIDOR    IS 'Clave primaria'
;
COMMENT ON COLUMN PF_SERVIDORES.C_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_SERVIDORES.F_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_SERVIDORES.C_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_SERVIDORES.F_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_SERVIDORES.C_SERVIDOR    IS 'Codigo de servidor'
;
COMMENT ON COLUMN PF_SERVIDORES.D_SERVIDOR    IS 'Descripcion de servidor'
;
COMMENT ON COLUMN PF_SERVIDORES.L_PRINCIPAL   IS 'Indica si es el servidor por defecto'
;

CREATE TABLE PF_TIPOS_AUTORIZACION
(
	X_TIPO_AUTORIZACION  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_TIPO_AUTORIZACION  VARCHAR2(10 CHAR) NOT NULL,    --  Codigo de tipo de autorizacion 
	D_TIPO_AUTORIZACION  VARCHAR2(255 CHAR) NOT NULL    --  Descripcion de tipo de autorizacion 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_TIPOS_AUTORIZACION IS 'Tabla de tipos de autorizaciones'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.X_TIPO_AUTORIZACION  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.C_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.F_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.C_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.F_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.C_TIPO_AUTORIZACION  IS 'Codigo de tipo de autorizacion'
;
COMMENT ON COLUMN PF_TIPOS_AUTORIZACION.D_TIPO_AUTORIZACION  IS 'Descripcion de tipo de autorizacion'
;

CREATE TABLE PF_TIPOS_DOCUMENTO
(
	X_TIPO_DOCUMENTO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_TIPO_DOCUMENTO  VARCHAR2(30 CHAR) NOT NULL,    --  Codigo de tipo de documento 
	D_TIPO_DOCUMENTO  VARCHAR2(255 CHAR) NOT NULL,    --  Descripcion de tipo de documento 
	L_VIGENTE         VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,    --  Indica si el tipo de documento esta vigente 
	APL_X_APLICACION  NUMBER(10)    --  Clave ajena a PF_APLICACIONES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_TIPOS_DOCUMENTO IS 'Tipos de documento'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.X_TIPO_DOCUMENTO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.C_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.F_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.C_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.F_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.C_TIPO_DOCUMENTO  IS 'Codigo de tipo de documento'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.D_TIPO_DOCUMENTO  IS 'Descripcion de tipo de documento'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.L_VIGENTE         IS 'Indica si el tipo de documento esta vigente'
;
COMMENT ON COLUMN PF_TIPOS_DOCUMENTO.APL_X_APLICACION  IS 'Clave ajena a PF_APLICACIONES'
;

CREATE TABLE PF_USUARIOS
(
	X_USUARIO     NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_IDENTIFICADOR         VARCHAR2(30 CHAR) NOT NULL,    --  DNI del usuario o codigo de cargo
	C_ANAGRAMA    VARCHAR2(50 CHAR),    --  Anagrama fiscal largo 
	D_NOMBRE      VARCHAR2(50 CHAR),    --  Nombre del usuario 
	D_APELL1      VARCHAR2(50 CHAR),    --  Primer apellido del usuario 
	D_APELL2      VARCHAR2(50 CHAR),    --  Segundo apellido del usuario 
	L_VIGENTE     VARCHAR2(1 CHAR) DEFAULT 'S',    -- Vigencia de un usuario o cargo 	
	C_TIPO        VARCHAR2(10 CHAR) DEFAULT 'USUARIO' NOT NULL,    -- Campo que distingue entre usuario y cargo
	PROV_X_PROVINCIA     NUMBER(10),						-- Clave ajena a PF_PROVINCIA
	L_VISIBLE 			 VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL, -- Visibilidad de usuario para usuarios de otras sedes
	L_ALERTA_NOTIF		 VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL  -- Habilitar alerta inicial de notificaciones	 	
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_USUARIOS IS 'Usuarios'
;
COMMENT ON COLUMN PF_USUARIOS.X_USUARIO     IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS.C_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS.F_CREADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS.C_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS.F_MODIFICADO  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS.C_IDENTIFICADOR         IS 'DNI del usuario o codigo de cargo'
;
COMMENT ON COLUMN PF_USUARIOS.C_ANAGRAMA    IS 'Anagrama fiscal largo'
;
COMMENT ON COLUMN PF_USUARIOS.D_NOMBRE      IS 'Nombre del usuario'
;
COMMENT ON COLUMN PF_USUARIOS.D_APELL1      IS 'Primer apellido del usuario'
;
COMMENT ON COLUMN PF_USUARIOS.D_APELL2      IS 'Segundo apellido del usuario'
;
COMMENT ON COLUMN PF_USUARIOS.L_VIGENTE        IS 'Vigencia de un usuario o cargo'
;
COMMENT ON COLUMN PF_USUARIOS.C_TIPO           IS 'Campo que distingue entre usuario y cargo'
;
COMMENT ON COLUMN PF_USUARIOS.PROV_X_PROVINCIA 		   IS 'Clave ajena a PF_PROVINCIA'
;
COMMENT ON COLUMN PF_USUARIOS.L_VISIBLE 		   IS 'Visibilidad de un usuario para usuarios de otras sedes'
;
COMMENT ON COLUMN PF_USUARIOS.L_ALERTA_NOTIF IS 'Habilitar alerta inicial de notificaciones'
;


CREATE TABLE PF_USUARIOS_VALIDADORES
(
	USU_X_USUARIO        	 	NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS
	USU_X_USUARIO_VALIDADOR     NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;
COMMENT ON TABLE PF_USUARIOS_VALIDADORES IS 'Usuarios validadores'
;
COMMENT ON COLUMN PF_USUARIOS_VALIDADORES.USU_X_USUARIO         IS 'Clave ajena a PF_USUARIOS, el usuario que va a ser validado'
;
COMMENT ON COLUMN PF_USUARIOS_VALIDADORES.USU_X_USUARIO_VALIDADOR    IS 'Clave ajena a PF_USUARIOS, el usuario que va a ser validador'
;

CREATE TABLE PF_USUARIOS_APLICACION
(
	X_USUARIO_APLICACION  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	APL_X_APLICACION      NUMBER(10) NOT NULL,    --  Clave ajena a PF_APLICACIONES 
	USU_X_USUARIO         NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_APLICACION.X_USUARIO_APLICACION  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_APLICACION.C_CREADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_APLICACION.F_CREADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_APLICACION.C_MODIFICADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_APLICACION.F_MODIFICADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_APLICACION.APL_X_APLICACION      IS 'Clave ajena a PF_APLICACIONES'
;
COMMENT ON COLUMN PF_USUARIOS_APLICACION.USU_X_USUARIO         IS 'Clave ajena a PF_USUARIOS'
;

CREATE TABLE PF_USUARIOS_AUTORIZACION
(
	X_USUARIO_AUTORIZACION    NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	F_PETICION                DATE NOT NULL,    --  Fecha de peticion 
	F_AUTORIZACION            DATE,    --  Fecha de autorizacion 
	F_REVOCACION              DATE,    --  Fecha de revocacion 
	T_OBSERVACIONES           VARCHAR2(1000 CHAR),    --  Observaciones 
	USU_X_USUARIO             NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	USU_X_USUARIO_AUTORIZADO  NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS (AUTORIZADO) 
	TAUT_X_TIPO_AUTORIZACION  NUMBER(10) NOT NULL    --  Clave ajena a PF_TIPOS_AUTORIZACION 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_USUARIOS_AUTORIZACION IS 'Tabla con las autorizaciones de los usuarios'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.X_USUARIO_AUTORIZACION    IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.C_CREADO                  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.F_CREADO                  IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.C_MODIFICADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.F_MODIFICADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.F_PETICION                IS 'Fecha de peticion'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.F_AUTORIZACION            IS 'Fecha de autorizacion'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.F_REVOCACION              IS 'Fecha de revocacion'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.T_OBSERVACIONES           IS 'Observaciones'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.USU_X_USUARIO             IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.USU_X_USUARIO_AUTORIZADO  IS 'Clave ajena a PF_USUARIOS (AUTORIZADO)'
;
COMMENT ON COLUMN PF_USUARIOS_AUTORIZACION.TAUT_X_TIPO_AUTORIZACION  IS 'Clave ajena a PF_TIPOS_AUTORIZACION'
;

CREATE TABLE PF_USUARIOS_CARGO
(
	X_USUARIO_CARGO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	F_INICIO         DATE NOT NULL,    --  Fecha de inicio de vigencia del puesto de trabajo 
	F_FIN            DATE,    --  Fecha de fin de vigencia del puesto de trabajo 
	USU_X_USUARIO    NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	USU_X_USUARIO_CARGO  NUMBER(10) NOT NULL -- Clave ajena a PF_USUARIOS (cargo) 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_CARGO.X_USUARIO_CARGO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.C_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.F_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.C_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.F_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.F_INICIO         IS 'Fecha de inicio de vigencia del puesto de trabajo'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.F_FIN            IS 'Fecha de fin de vigencia del puesto de trabajo'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.USU_X_USUARIO    IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_USUARIOS_CARGO.USU_X_USUARIO_CARGO  IS 'Clave ajena a PF_USUARIOS (cargo)'
;

CREATE TABLE PF_USUARIOS_EMAIL
(
	X_USUARIO_EMAIL  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	D_EMAIL          VARCHAR2(255 CHAR) NOT NULL,    --  Email del usuario 
	L_NOTIFICAR      VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si se notifica a este correo 
	USU_X_USUARIO    NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_EMAIL.X_USUARIO_EMAIL  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.C_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.F_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.C_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.F_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.D_EMAIL          IS 'Email del usuario'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.L_NOTIFICAR      IS 'Indica si se notifica a este correo'
;
COMMENT ON COLUMN PF_USUARIOS_EMAIL.USU_X_USUARIO    IS 'Clave ajena a PF_USUARIOS'
;

CREATE TABLE PF_USUARIOS_MOVIL
(
	X_USUARIO_MOVIL  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	D_MOVIL          VARCHAR2(255 CHAR) NOT NULL,    --  Numero de movil 
	L_NOTIFICAR      VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si se notifica a este numero de movil 
	USU_X_USUARIO    NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_MOVIL.X_USUARIO_MOVIL  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.C_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.F_CREADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.C_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.F_MODIFICADO     IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.D_MOVIL          IS 'Numero de movil'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.L_NOTIFICAR      IS 'Indica si se notifica a este numero de movil'
;
COMMENT ON COLUMN PF_USUARIOS_MOVIL.USU_X_USUARIO    IS 'Clave ajena a PF_USUARIOS'
;

CREATE TABLE PF_USUARIOS_PARAMETRO
(
	X_USUARIO_PARAMETRO  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	T_VALOR              VARCHAR2(1000 CHAR) NOT NULL,    --  Valor del parametro 
	PAR_X_PARAMETRO      NUMBER(10) NOT NULL,    --  Clave ajena a PF_PARAMETROS 
	USU_X_USUARIO        NUMBER(10) NOT NULL    --  Clave ajena de PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.X_USUARIO_PARAMETRO  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.C_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.F_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.C_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.F_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.T_VALOR              IS 'Valor del parametro'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.PAR_X_PARAMETRO      IS 'Clave ajena a PF_PARAMETROS'
;
COMMENT ON COLUMN PF_USUARIOS_PARAMETRO.USU_X_USUARIO        IS 'Clave ajena de PF_USUARIOS'
;

CREATE TABLE PF_USUARIOS_PERFIL
(
	X_USUARIO_PERFIL  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	F_INICIO          DATE NOT NULL,    --  Fecha de inicio de vigencia del perfil para ese usuario 
	F_FIN             DATE,    --  Fecha de fin de vigencia del perfil para ese usuario 
	T_OBSERVACIONES   VARCHAR2(1000 CHAR),    --  Observaciones 
	USU_X_USUARIO     NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	PER_X_PERFIL      NUMBER(10) NOT NULL    --  Clave ajena a PF_PERFILES 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_PERFIL.X_USUARIO_PERFIL  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.C_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.F_CREADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.C_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.F_MODIFICADO      IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.F_INICIO          IS 'Fecha de inicio de vigencia del perfil para ese usuario'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.F_FIN             IS 'Fecha de fin de vigencia del perfil para ese usuario'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.T_OBSERVACIONES   IS 'Observaciones'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.USU_X_USUARIO     IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_USUARIOS_PERFIL.PER_X_PERFIL      IS 'Clave ajena a PF_PERFILES'
;

CREATE TABLE PF_USUARIOS_REMITENTE
(
	X_USUARIO_REMITENTE  NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	L_NOTIFICA_EMAIL      VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si se notifica al remitente via email 
	L_NOTIFICA_MOVIL      VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,    --  Indica si se notifica al remitente via movil 
	USU_X_USUARIO         NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS 
	PET_X_PETICION        NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	GRU_X_GRUPO NUMBER(10),
	ESTADO_PARA_REMITENTE VARCHAR2(50)
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_USUARIOS_REMITENTE IS 'Tabla de remitentes de peticiones'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.X_USUARIO_REMITENTE  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.C_CREADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.F_CREADO              IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.C_MODIFICADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.F_MODIFICADO          IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.L_NOTIFICA_EMAIL      IS 'Indica si se notifica al remitente via email'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.L_NOTIFICA_MOVIL      IS 'Indica si se notifica al remitente via movil'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.USU_X_USUARIO         IS 'Clave ajena a PF_USUARIOS'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.PET_X_PETICION        IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.GRU_X_GRUPO IS 'Clave ajena a PF_GRUPOS'
;
COMMENT ON COLUMN PF_USUARIOS_REMITENTE.ESTADO_PARA_REMITENTE IS 'Por medio de este campo se identifica en que estado esta para los remitentes, porque los remitentes no cuentan con etiquetas de estado en la peticion'
;

CREATE TABLE PF_OTROS_PARAMETRO
(
	X_OTRO_PARAMETRO    NUMBER(10) NOT NULL,    -- Clave primaria de PF_OTROS_PARAMETRO 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	T_VALOR              VARCHAR2(1000 CHAR) NOT NULL,    -- Valor del parametro 
	PAR_X_PARAMETRO      NUMBER(10) NOT NULL,    -- Clave ajena a PF_PARAMETROS 
	OTPF_X_OTRO_PFIRMA  NUMBER(10) NOT NULL    -- Clave ajena a PF_OTROS_PFIRMA 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_OTROS_PARAMETRO IS 'Valores de parametros para configuracion de comunicacion con otros portafirmas'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.X_OTRO_PARAMETRO    IS 'Clave primaria de PF_OTROS_PARAMETRO'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.C_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.F_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.C_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.F_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.T_VALOR              IS 'Valor del parametro'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.PAR_X_PARAMETRO      IS 'Clave ajena a PF_PARAMETROS'
;
COMMENT ON COLUMN PF_OTROS_PARAMETRO.OTPF_X_OTRO_PFIRMA  IS 'Clave ajena a PF_OTROS_PFIRMA'
;

CREATE TABLE PF_OTROS_PFIRMA
(
	X_OTRO_PFIRMA  NUMBER(10) NOT NULL,    -- Clave primaria de PF_OTROS_PFIRMA 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_OTRO_PFIRMA  VARCHAR2(30 CHAR) NOT NULL,    -- Codigo del portafirmas remoto 
	D_OTRO_PFIRMA  VARCHAR2(255 CHAR) NOT NULL,    -- Descripciï¿½n del portafirmas remoto 
	L_VIGENTE       VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL    -- Vigencia de comunicacion con portafirmas remoto 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_OTROS_PFIRMA IS 'Pfirmas externos con los que comunicar'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.X_OTRO_PFIRMA  IS 'Clave primaria de PF_OTROS_PFIRMA'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.C_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.F_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.C_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.F_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.C_OTRO_PFIRMA  IS 'Codigo del portafirmas remoto'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.D_OTRO_PFIRMA  IS 'Descripciï¿½n del portafirmas remoto'
;
COMMENT ON COLUMN PF_OTROS_PFIRMA.L_VIGENTE       IS 'Vigencia de comunicacion con portafirmas remoto'
;

CREATE TABLE PF_USUARIOS_OTRO
(
	X_USUARIO_OTRO      NUMBER(10) NOT NULL,    -- Clave primaria de PF_USUARIOS_OTRO 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	L_VIGENTE            VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,    -- Vigencia de usuario en portafirmas externo 
	OTPF_X_OTRO_PFIRMA  NUMBER(10) NOT NULL,    -- Clave ajena a PF_OTROS_PFIRMA 
	USU_X_USUARIO        NUMBER(10) NOT NULL    -- Clave ajena a PF_USUARIOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON TABLE PF_USUARIOS_OTRO IS 'Usuarios con portafirmas externos'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.X_USUARIO_OTRO      IS 'Clave primaria de PF_USUARIOS_OTRO'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.C_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.F_CREADO             IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.C_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.F_MODIFICADO         IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.L_VIGENTE            IS 'Vigencia de usuario en portafirmas externo'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.OTPF_X_OTRO_PFIRMA  IS 'Clave ajena a PF_OTROS_PFIRMA'
;
COMMENT ON COLUMN PF_USUARIOS_OTRO.USU_X_USUARIO        IS 'Clave ajena a PF_USUARIOS'
;

CREATE TABLE PF_AMBITOS_DOCUMENTOS
(
	X_AMBITO_DOCUMENTO NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO           VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO           DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO       VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO       DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_DESCRIPCION      VARCHAR2(50 CHAR) DEFAULT 'INTERNO' NOT NULL
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_AMBITOS_DOCUMENTOS.X_AMBITO_DOCUMENTO IS 'Clave primaria'
;
COMMENT ON COLUMN PF_AMBITOS_DOCUMENTOS.C_DESCRIPCION IS 'Ã�mbito del documento'
;
COMMENT ON COLUMN PF_AMBITOS_DOCUMENTOS.C_CREADO               IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_AMBITOS_DOCUMENTOS.F_CREADO               IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_AMBITOS_DOCUMENTOS.C_MODIFICADO           IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_AMBITOS_DOCUMENTOS.F_MODIFICADO           IS 'Campo de auditoria'
;

CREATE TABLE PF_AGENTES_MOVIL
(
	X_AGENTE_MOVIL NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO       VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO       DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO   VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO   DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_DESCRIPCION  VARCHAR2(200 CHAR) NOT NULL
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_AGENTES_MOVIL.X_AGENTE_MOVIL IS 'Clave primaria';
COMMENT ON COLUMN PF_AGENTES_MOVIL.C_DESCRIPCION  IS 'Ã�gente del dispositivo mÃ³vil';
COMMENT ON COLUMN PF_AGENTES_MOVIL.C_CREADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AGENTES_MOVIL.F_CREADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AGENTES_MOVIL.C_MODIFICADO   IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AGENTES_MOVIL.F_MODIFICADO   IS 'Campo de auditoria';

CREATE TABLE PF_NIVELES_IMPORTANCIA
(
	X_NIVEL_IMPORTANCIA NUMBER(10)   NOT NULL,    --  Clave primaria 
	C_CREADO            VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO            DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO        VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO        DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
  C_CODIGO_NIVEL      VARCHAR2(1 CHAR)  DEFAULT '1' NOT NULL, -- CÃ³digo numÃ©rico del nivel de importancia          
	C_DESCRIPCION       VARCHAR2(50 CHAR) NOT NULL -- DescripciÃ³n del nivel de importancia
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.X_NIVEL_IMPORTANCIA IS 'Clave primaria';
COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.C_DESCRIPCION       IS 'DescripciÃ³n del nivel de importancia';
COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.C_CREADO            IS 'Campo de auditoria';
COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.F_CREADO            IS 'Campo de auditoria';
COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.C_MODIFICADO        IS 'Campo de auditoria';
COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.F_MODIFICADO        IS 'Campo de auditoria';
COMMENT ON COLUMN PF_NIVELES_IMPORTANCIA.C_CODIGO_NIVEL      IS 'CÃ³digo numÃ©rico del nivel de importancia';

CREATE TABLE PF_PROVINCIA
(
	X_PROVINCIA         NUMBER(10)   NOT NULL,    --  Clave primaria
	C_CREADO            VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_CREADO            DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
	C_MODIFICADO        VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_MODIFICADO        DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
    C_CODIGO_PROVINCIA  VARCHAR2(255 CHAR)  NOT NULL, -- Código numérico de la provincia
	C_NOMBRE            VARCHAR2(255 CHAR) NOT NULL -- Nombre de la provincia
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PROVINCIA.X_PROVINCIA        IS 'Clave primaria';
COMMENT ON COLUMN PF_PROVINCIA.C_NOMBRE           IS 'Nombre de la provincia';
COMMENT ON COLUMN PF_PROVINCIA.C_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PROVINCIA.F_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PROVINCIA.C_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PROVINCIA.F_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PROVINCIA.C_CODIGO_PROVINCIA IS 'CÃ³digo numÃ©rico de la provincia';


CREATE TABLE PF_ADMINISTRADORES_PROVINCIAS
(
	X_ADMINISTRADOR_PROVINCIA   NUMBER(10)   NOT NULL,    --  Clave primaria
	C_CREADO                    VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_CREADO                    DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
	C_MODIFICADO                VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_MODIFICADO                DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
  USU_X_USUARIO               NUMBER(10)   NOT NULL,    --  Clave ajena al usuario
	PROV_X_PROVINCIA            NUMBER(10)   NOT NULL     --  Clave ajena a la provincia
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.X_ADMINISTRADOR_PROVINCIA  IS 'Clave primaria';
COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.C_CREADO                   IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.F_CREADO                   IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.C_MODIFICADO               IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.F_MODIFICADO               IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.USU_X_USUARIO              IS 'Clave ajena al usuario que administra';
COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.PROV_X_PROVINCIA           IS 'Clave ajena a la provincia administrada';

CREATE TABLE PF_ATRIBUTOS_SESION
(
	X_SESION            NUMBER(10)   NOT NULL,    --  Clave primaria
	C_CREADO            VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_CREADO            DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
	C_MODIFICADO        VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_MODIFICADO        DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
  	C_ID_SESION         VARCHAR2(255 CHAR) NOT NULL, -- Identificador de sesiÃ³n  
  	C_IP                VARCHAR2(40 CHAR) NOT NULL, -- DirecciÃ³n IP
  	C_USER_AGENT        VARCHAR2(1000 CHAR) NOT NULL,  -- User Agent
  	C_NOMBRE_USUARIO        VARCHAR2(255 CHAR) NOT NULL,  -- Nombre del usuario
  	USU_X_USUARIO        NUMBER(10) NOT NULL  -- Clave ajena a la tabla de usuarios
)
TABLESPACE  TS_PFIRMA_DATOS
;


COMMENT ON COLUMN PF_ATRIBUTOS_SESION.X_SESION IS 'Clave primaria';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.C_CREADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.F_CREADO        IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.C_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.F_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.C_ID_SESION       IS 'Identificador de sesion';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.C_IP       IS 'Direccion IP';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.C_USER_AGENT       IS 'User Agent del cliente';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.C_NOMBRE_USUARIO       IS 'Nombre del usuario';
COMMENT ON COLUMN PF_ATRIBUTOS_SESION.USU_X_USUARIO       IS 'Clave ajena a la tabla de usuarios';

CREATE TABLE PF_GRUPOS
(
	X_GRUPO             NUMBER(10)   NOT NULL,    --  Clave primaria
	C_CREADO            VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_CREADO            DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
	C_MODIFICADO        VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_MODIFICADO        DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
	C_NOMBRE            VARCHAR2(255 CHAR) NOT NULL, -- Nombre del grupo
	C_DESCRIPCION       VARCHAR2(255 CHAR), -- Descripción del grupo
	PROV_X_PROVINCIA	NUMBER(10) -- Sede del grupo
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_GRUPOS.X_GRUPO            IS 'Clave primaria';
COMMENT ON COLUMN PF_GRUPOS.C_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_GRUPOS.F_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_GRUPOS.C_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_GRUPOS.F_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_GRUPOS.C_NOMBRE           IS 'Nombre del grupo';
COMMENT ON COLUMN PF_GRUPOS.C_DESCRIPCION      IS 'DescripciÃ³n del grupo';
COMMENT ON COLUMN PF_GRUPOS.PROV_X_PROVINCIA   IS 'Clave aSede del grupo';

ALTER TABLE PF_GRUPOS ADD CONSTRAINT PF_GRUPO_PK 
	PRIMARY KEY (X_GRUPO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

CREATE SEQUENCE PF_S_GRUPO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;



---------------- CREACIÃ“N DE LA TABLA DE GRUPOS DE USUARIOS ---------------

CREATE TABLE PF_USUARIOS_GRUPOS
(
	X_USUARIO_GRUPO      NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	USU_X_USUARIO        NUMBER(10) NOT NULL,    --  Clave ajena de PF_USUARIOS
  GRU_X_GRUPO          NUMBER(10) NOT NULL     --  Clave ajena a PF_GRUPOS 
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_USUARIOS_GRUPOS.X_USUARIO_GRUPO      IS 'Clave primaria';
COMMENT ON COLUMN PF_USUARIOS_GRUPOS.C_CREADO             IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_GRUPOS.F_CREADO             IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_GRUPOS.C_MODIFICADO         IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_GRUPOS.F_MODIFICADO         IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_GRUPOS.GRU_X_GRUPO          IS 'Clave ajena a PF_GRUPOS';
COMMENT ON COLUMN PF_USUARIOS_GRUPOS.USU_X_USUARIO        IS 'Clave ajena de PF_USUARIOS';

-- Plantillas peticiÃ³n (Julio 2013)

CREATE TABLE PF_PLANTILLA_PETICION
(
	X_PLANTILLA_PETICION  NUMBER(10)   NOT NULL,    --  Clave primaria
	C_CREADO              VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_CREADO              DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
	C_MODIFICADO          VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
	F_MODIFICADO          DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria
  C_CODIGO_PLANTILLA    VARCHAR2(255 CHAR) NOT NULL, -- Codigo de la plantilla
  D_DESTINATARIOS       VARCHAR2(255 CHAR), -- Destinatarios de la peticion
	D_ASUNTO              VARCHAR2(255 CHAR), -- Asunto de la peticion
  D_REFERENCIA          VARCHAR2(30 CHAR), -- Referencia de la peticion
  C_TIPO_FIRMA          VARCHAR2(30 CHAR) DEFAULT 'CASCADA' NOT NULL,  -- Tipo de firma (cascada, paralelo)
  L_AVISO_LEIDO         VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,   -- Se notifica si la peticion se ha leiÂ­do
  L_AVISO_DEVUELTO      VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,   -- Se notifica si la peticion se ha devuelto
  L_AVISO_FIRMADO       VARCHAR2(1 CHAR) DEFAULT 'S' NOT NULL,   -- Se notifica si la peticion se ha firmado
  L_AVISO_VISTO_BUENO   VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,   -- Se notifica si la peticion ha recibido el visto bueno
  L_AGREGAR_VISTO_BUENO VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL,   -- Indica si se agrega visto bueno
  F_INICIO              DATE,         -- Fecha de inicio de la peticion
  F_CADUCIDAD           DATE,         -- Fecha de caducidad de la peticion
  C_AMBITO_DOCUMENTOS   NUMBER(10) DEFAULT 1 NOT NULL, -- Ambito de los documentos
  C_NIVEL_IMPORTANCIA   VARCHAR2(1 CHAR) DEFAULT '1' NOT NULL, -- Nivel de importancia de la peticion
  L_AGREGAR_TIMESTAMP   VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL, -- Indica si se agrega sello de tiempo a la/s firma/s
  C_CONFIGURACION_FIRMA VARCHAR2(50 CHAR) DEFAULT 'default' NOT NULL, -- Configuracion de firma a usar
  T_PETICION            CLOB,          -- Texto de la peticion
  USU_X_USUARIO         NUMBER(10) NOT NULL,-- Clave ajena a PF_USUARIOS
  L_SOLO_NOTIF_ACC_REMITE CHAR(1) DEFAULT 'N' NOT NULL, -- Indica si si se marca la opciÃ³n "Notificar sÃ³lo al remitente"
  C_FIRMA_VISTOBUENO VARCHAR2(50 CHAR)
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_PLANTILLA_PETICION.X_PLANTILLA_PETICION  IS 'Clave primaria';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_CREADO              IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.F_CREADO              IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_MODIFICADO          IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.F_MODIFICADO          IS 'Campo de auditoria';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_CODIGO_PLANTILLA    IS 'Codigo de la plantilla';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.D_DESTINATARIOS       IS 'Destinatarios de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.D_ASUNTO              IS 'Asunto de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.D_REFERENCIA          IS 'Referencia de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_TIPO_FIRMA          IS 'Tipo de firma (cascada, paralelo)';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_AVISO_LEIDO         IS 'Se notifica si la peticion se ha leido';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_AVISO_DEVUELTO      IS 'Se notifica si la peticion se ha devuelto';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_AVISO_FIRMADO       IS 'Se notifica si la peticion se ha firmado';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_AVISO_VISTO_BUENO   IS 'Se notifica si la peticion ha recibido el visto bueno';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_AGREGAR_VISTO_BUENO IS 'Indica si se agrega visto bueno';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.F_INICIO              IS 'Fecha de inicio de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.F_CADUCIDAD           IS 'Fecha de caducidad de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_AMBITO_DOCUMENTOS   IS 'Ambito de los documentos';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_NIVEL_IMPORTANCIA   IS 'Nivel de importancia de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_AGREGAR_TIMESTAMP   IS 'Indica si se agrega sello de tiempo a la/s firma/s';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_CONFIGURACION_FIRMA IS 'Configuracion de firma a usar';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.T_PETICION            IS 'Texto de la peticion';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.USU_X_USUARIO         IS 'Clave ajena a PF_USUARIOS';
COMMENT ON COLUMN PF_PLANTILLA_PETICION.L_SOLO_NOTIF_ACC_REMITE	 IS 'Indica en la plantilla si las acciones solamente se notifican al remitente de la peticiÃ³n';


-- TABLA PF_EMAILS_PETICION
CREATE TABLE PF_EMAILS_PETICION
(
	X_EMAIL_PETICION     NUMBER(10) NOT NULL,    --  Clave primaria 
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	PET_X_PETICION       NUMBER(10) NOT NULL,    --  Clave ajena a PF_PETICIONES 
	C_EMAIL              VARCHAR2(255 CHAR) NOT NULL    --  Email
)
TABLESPACE  TS_PFIRMA_DATOS
;

COMMENT ON COLUMN PF_EMAILS_PETICION.X_EMAIL_PETICION  IS 'Clave primaria'
;
COMMENT ON COLUMN PF_EMAILS_PETICION.C_CREADO            IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_EMAILS_PETICION.F_CREADO            IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_EMAILS_PETICION.C_MODIFICADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_EMAILS_PETICION.F_MODIFICADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_EMAILS_PETICION.PET_X_PETICION       IS 'Clave ajena a PF_PETICIONES'
;
COMMENT ON COLUMN PF_EMAILS_PETICION.C_EMAIL     IS 'Email de notificacion'
;

     CREATE TABLE "PF_USUARIOS_INVITADOS" 
   (	
    "X_USU_INV" NUMBER(10,0) NOT NULL ENABLE, 
	"C_CREADO" VARCHAR2(20 BYTE) DEFAULT USER NOT NULL ENABLE, 
	"F_CREADO" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"C_MODIFICADO" VARCHAR2(20 BYTE) DEFAULT USER NOT NULL ENABLE, 
	"F_MODIFICADO" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"C_DNI" VARCHAR2(10 BYTE), 
	"C_MAIL" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"C_NOMBRE" VARCHAR2(20 BYTE), 
	"C_APELLIDO1" VARCHAR2(20 BYTE), 
	"C_APELLIDO2" VARCHAR2(20 BYTE), 
	 CONSTRAINT "X_USU_INV_PK" PRIMARY KEY ("X_USU_INV"));
	 
ALTER TABLE PF_USUARIOS_INVITADOS ADD  CONSTRAINT "PF_USU_INV_C_DNI_UK" UNIQUE ("C_DNI");
ALTER TABLE PF_USUARIOS_INVITADOS ADD CONSTRAINT "PF_USU_INV_C_MAIL_UK" UNIQUE ("C_MAIL");

   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."X_USU_INV" IS 'Clave primaria';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_CREADO" IS 'Campo de auditoria';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."F_CREADO" IS 'Campo de auditoria';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_MODIFICADO" IS 'Campo de auditoria';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."F_MODIFICADO" IS 'Campo de auditoria';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_DNI" IS 'DNI del usuario invitado';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_MAIL" IS 'Correo electrónico del usuario invitado';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_NOMBRE" IS 'Nombre del usuario invitado';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_APELLIDO1" IS 'Apellido 1 del usuario invitado';
   COMMENT ON COLUMN "PF_USUARIOS_INVITADOS"."C_APELLIDO2" IS 'Apellido 2 del usuario invitado';
   COMMENT ON TABLE "PF_USUARIOS_INVITADOS"  IS 'Tabla de usuario invitados';

  

-- PF_AMBITOS_MENSAJES --
CREATE TABLE PF_AMBITOS_MENSAJES (X_AMBITO_MENSAJE NUMBER(10) NOT NULL, 
C_CREADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL, 
F_CREADO DATE DEFAULT SYSDATE  NOT NULL, 
C_MODIFICADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL, 
F_MODIFICADO DATE DEFAULT SYSDATE  NOT NULL, 
C_DESCRIPCION VARCHAR2(200 CHAR) NOT NULL, 
CONSTRAINT PF_AMB_MEN_PK PRIMARY KEY (X_AMBITO_MENSAJE), 
CONSTRAINT PF_AMB_MEN_DESC_UK UNIQUE (C_DESCRIPCION));

COMMENT ON COLUMN PF_AMBITOS_MENSAJES.X_AMBITO_MENSAJE IS 'Clave primaria';
COMMENT ON COLUMN PF_AMBITOS_MENSAJES.C_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AMBITOS_MENSAJES.F_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AMBITOS_MENSAJES.C_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AMBITOS_MENSAJES.F_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_AMBITOS_MENSAJES.C_DESCRIPCION IS 'Ã�mbito del mensaje';

   

--  Create Primary Key Constraints 
ALTER TABLE PF_ACCIONES ADD CONSTRAINT PF_ACC_PK 
	PRIMARY KEY (X_ACCION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_APLICACIONES ADD CONSTRAINT PF_APL_PK 
	PRIMARY KEY (X_APLICACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_APLICACIONES_PARAMETRO ADD CONSTRAINT PF_APAR_PK 
	PRIMARY KEY (X_APLICACION_PARAMETRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_ARCHIVOS ADD CONSTRAINT PF_ARC_PK 
	PRIMARY KEY (X_ARCHIVO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_BLOQUES ADD CONSTRAINT PF_BLQ_PK 
	PRIMARY KEY (X_BLOQUE) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_COMENTARIOS ADD CONSTRAINT PF_COM_PK 
	PRIMARY KEY (X_COMENTARIO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_CONFIGURACIONES ADD CONSTRAINT PF_CON_PK 
	PRIMARY KEY (X_CONFIGURACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_CONFIGURACIONES_PARAMETRO ADD CONSTRAINT PF_CPAR_PK 
	PRIMARY KEY (X_CONFIGURACION_PARAMETRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_DOCUMENTOS ADD CONSTRAINT PF_DOC_PK 
	PRIMARY KEY (X_DOCUMENTO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_ETIQUETAS ADD CONSTRAINT PF_ETIQ_PK 
	PRIMARY KEY (X_ETIQUETA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_ETIQUETAS_PETICION ADD CONSTRAINT PF_ETPE_PK 
	PRIMARY KEY (X_ETIQUETA_PETICION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_ETIQUETAS_USUARIO ADD CONSTRAINT PF_ETUS_PK 
	PRIMARY KEY (X_ETIQUETA_USUARIO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_FILTROS ADD CONSTRAINT PF_FIL_PK 
	PRIMARY KEY (X_FILTRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_FILTROS_AUTORIZACION ADD CONSTRAINT PF_FAUT_PK 
	PRIMARY KEY (X_FILTRO_AUTORIZACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_FIRMANTES ADD CONSTRAINT PF_FIR_PK 
	PRIMARY KEY (X_FIRMANTE) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_FIRMAS ADD CONSTRAINT PF_FIRM_PK 
	PRIMARY KEY (X_FIRMA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_FIRMAS_BLOQUE ADD CONSTRAINT PF_FBLQ_PK 
	PRIMARY KEY (X_FIRMA_BLOQUE) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_LINEAS_FIRMA ADD CONSTRAINT PF_LFIR_PK 
	PRIMARY KEY (X_LINEA_FIRMA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PARAMETROS ADD CONSTRAINT PF_PAR_PK 
	PRIMARY KEY (X_PARAMETRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PERFILES ADD CONSTRAINT PF_PER_PK 
	PRIMARY KEY (X_PERFIL) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PETICIONES ADD CONSTRAINT PF_PET_PK 
	PRIMARY KEY (X_PETICION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PETICIONES_AVISO ADD CONSTRAINT PF_PAVI_PK 
	PRIMARY KEY (X_PETICION_AVISO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PETICIONES_HISTORICO ADD CONSTRAINT PF_PEHI_PK 
	PRIMARY KEY (X_PETICION_HISTORICO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PETICIONES_INFORMACION ADD CONSTRAINT PF_PEIN_PK 
	PRIMARY KEY (X_PETICION_INFORMACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PETICIONES_VALOR ADD CONSTRAINT PF_PEVA_PK 
	PRIMARY KEY (X_PETICION_VALOR) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_SERVIDORES ADD CONSTRAINT PF_SER_PK 
	PRIMARY KEY (X_SERVIDOR) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_TIPOS_AUTORIZACION ADD CONSTRAINT PF_TAUT_PK 
	PRIMARY KEY (X_TIPO_AUTORIZACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_TIPOS_DOCUMENTO ADD CONSTRAINT PF_TDOC_PK 
	PRIMARY KEY (X_TIPO_DOCUMENTO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS ADD CONSTRAINT PF_USU_PK 
	PRIMARY KEY (X_USUARIO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_VALIDADORES ADD CONSTRAINT PF_USUVAL_PK 
	PRIMARY KEY (USU_X_USUARIO,USU_X_USUARIO_VALIDADOR) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_APLICACION ADD CONSTRAINT PF_UAPL_PK 
	PRIMARY KEY (X_USUARIO_APLICACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_AUTORIZACION ADD CONSTRAINT PF_UAUT_PK 
	PRIMARY KEY (X_USUARIO_AUTORIZACION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_CARGO ADD CONSTRAINT PF_UCAR_PK 
	PRIMARY KEY (X_USUARIO_CARGO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_EMAIL ADD CONSTRAINT PF_UMAIL_PK 
	PRIMARY KEY (X_USUARIO_EMAIL) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_MOVIL ADD CONSTRAINT PF_UMOV_PK 
	PRIMARY KEY (X_USUARIO_MOVIL) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_PARAMETRO ADD CONSTRAINT PF_UPAR_PK 
	PRIMARY KEY (X_USUARIO_PARAMETRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_PERFIL ADD CONSTRAINT PF_UPER_PK 
	PRIMARY KEY (X_USUARIO_PERFIL) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_REMITENTE ADD CONSTRAINT PF_UREM_PK 
	PRIMARY KEY (X_USUARIO_REMITENTE) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_OTROS_PARAMETRO ADD CONSTRAINT PF_OTPA_PK 
	PRIMARY KEY (X_OTRO_PARAMETRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_OTROS_PFIRMA ADD CONSTRAINT PF_OTPF_PK 
	PRIMARY KEY (X_OTRO_PFIRMA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_USUARIOS_OTRO ADD CONSTRAINT PF_USOT_PK 
	PRIMARY KEY (X_USUARIO_OTRO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_AMBITOS_DOCUMENTOS ADD CONSTRAINT PF_AMB_DOC_PK 
	PRIMARY KEY (X_AMBITO_DOCUMENTO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_AGENTES_MOVIL ADD CONSTRAINT PF_AG_MOVIL_PK 
	PRIMARY KEY (X_AGENTE_MOVIL) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_NIVELES_IMPORTANCIA ADD CONSTRAINT PF_NV_IMP_PK 
	PRIMARY KEY (X_NIVEL_IMPORTANCIA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PROVINCIA ADD CONSTRAINT PF_PROV_PK 
	PRIMARY KEY (X_PROVINCIA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_ADMINISTRADORES_PROVINCIAS ADD CONSTRAINT PF_ADMIN_PROV_PK 
	PRIMARY KEY (X_ADMINISTRADOR_PROVINCIA) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_ATRIBUTOS_SESION ADD CONSTRAINT PF_ATR_SES_PK 
	PRIMARY KEY (X_SESION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;


--  Create Constraints. Domains.
ALTER TABLE PF_ACCIONES
ADD CONSTRAINT PF_ACC_C_TIPO_CH CHECK (C_TIPO IN ('PLSQL', 'WEB'))
;


ALTER TABLE PF_APLICACIONES
	ADD CONSTRAINT PF_APL_C_APLICACION_UK UNIQUE (C_APLICACION)
	USING INDEX TABLESPACE TS_PFIRMA_INDICES
;


ALTER TABLE PF_CONFIGURACIONES
	ADD CONSTRAINT PF_CON_C_CONFIGURACION_UK UNIQUE (C_CONFIGURACION)
	USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_CONFIGURACIONES
ADD CONSTRAINT PF_CON_L_PRINCIPAL_CH CHECK (L_PRINCIPAL IN ('S','N'))
;


ALTER TABLE PF_DOCUMENTOS
ADD CONSTRAINT PF_DOC_L_FIRMABLE_CH CHECK (L_FIRMABLE IN ('S','N'))
;


ALTER TABLE PF_ETIQUETAS
	ADD CONSTRAINT PF_ETIQ_C_ETIQUETA_UK UNIQUE (C_ETIQUETA)
	USING INDEX TABLESPACE TS_PFIRMA_INDICES
;


ALTER TABLE PF_FILTROS
ADD CONSTRAINT PF_FIL_L_VALIDO_CH CHECK (L_VALIDO IN ('S','N'))
;


ALTER TABLE PF_FILTROS_AUTORIZACION
ADD CONSTRAINT PF_FAUT_L_VALIDO_CH CHECK (L_VALIDO IN ('S','N'))
;


ALTER TABLE PF_PARAMETROS
	ADD CONSTRAINT PF_PAR_C_PARAMETRO_UK UNIQUE (C_PARAMETRO)
	USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

ALTER TABLE PF_PERFILES
	ADD CONSTRAINT PF_PER_C_PERFIL_UK UNIQUE (C_PERFIL)
	USING INDEX TABLESPACE TS_PFIRMA_INDICES
;


ALTER TABLE PF_PETICIONES
ADD CONSTRAINT PF_PET_L_FIRMA_CASCADA_CH CHECK (L_FIRMA_EN_CASCADA IN ('N', 'S'))
;

ALTER TABLE PF_PETICIONES
ADD CONSTRAINT PF_PET_L_FIRMA_PRIMER_CH CHECK (L_FIRMA_PRIMER_FIRMANTE IN ('S','N'))
;


ALTER TABLE PF_PETICIONES_INFORMACION
ADD CONSTRAINT PF_PEIN_L_VISIBLE_CHQ CHECK (L_VISIBLE IN ('S','N'))
;

ALTER TABLE PF_PETICIONES_INFORMACION
ADD CONSTRAINT PF_PEIN_L_OBLIGATORIO_CHQ CHECK (L_OBLIGATORIO IN ('S','N'))
;

ALTER TABLE PF_PETICIONES_INFORMACION
ADD CONSTRAINT PF_PEIN_L_VIGENTE_CHQ CHECK (L_VIGENTE IN ('S','N'))
;

ALTER TABLE PF_SERVIDORES
ADD CONSTRAINT PF_SER_L_PRINCIPAL_CH CHECK (L_PRINCIPAL IN ('S','N'))
;

ALTER TABLE PF_TIPOS_DOCUMENTO
ADD CONSTRAINT PF_TDOC_L_VIGENTE_CH CHECK (L_VIGENTE IN ('S','N'))
;


ALTER TABLE PF_USUARIOS_EMAIL
ADD CONSTRAINT PF_UMAIL_L_NOTIFICAR_CH CHECK (L_NOTIFICAR IN ('N', 'S'))
;

ALTER TABLE PF_USUARIOS_MOVIL
ADD CONSTRAINT PF_UMOV_L_NOTIFICAR_CH CHECK (L_NOTIFICAR IN ('N', 'S'))
;


ALTER TABLE PF_USUARIOS_REMITENTE
ADD CONSTRAINT PF_UREM_L_NOTIFICA_EMAIL_CH CHECK (L_NOTIFICA_EMAIL IN ('S','N'))
;

ALTER TABLE PF_USUARIOS_REMITENTE
ADD CONSTRAINT PF_UREM_L_NOTIFICA_MOVIL_CH CHECK (L_NOTIFICA_MOVIL IN ('S','N'))
;

ALTER TABLE PF_OTROS_PFIRMA
ADD CONSTRAINT PF_OTPF_L_VIGENTE_CH CHECK (L_VIGENTE IN ('S','N'))
;

ALTER TABLE PF_USUARIOS_OTRO
ADD CONSTRAINT PF_USOT_L_VIGENTE_CH CHECK (L_VIGENTE IN ('S','N'))
;

ALTER TABLE PF_SERVIDORES
	ADD CONSTRAINT PF_SER_C_SERVIDOR_UK UNIQUE (C_SERVIDOR) 
;

ALTER TABLE PF_TIPOS_AUTORIZACION
	ADD CONSTRAINT PF_TAUT_C_TIPO_AUTOR_UK UNIQUE (C_TIPO_AUTORIZACION)
;

ALTER TABLE PF_PETICIONES
	ADD CONSTRAINT PF_PET_C_HASH_UK UNIQUE (C_HASH)
;

ALTER TABLE PF_DOCUMENTOS
	ADD CONSTRAINT PF_DOC_C_HASH_UK UNIQUE (C_HASH)
;

ALTER TABLE PF_ARCHIVOS
	ADD CONSTRAINT PF_ARC_C_HASH_UK UNIQUE (C_HASH, C_TIPO)
;

ALTER TABLE PF_USUARIOS
ADD CONSTRAINT PF_USU_L_VIGENTE_CH CHECK (L_VIGENTE IN ('S','N'))
;

ALTER TABLE PF_AMBITOS_DOCUMENTOS
	ADD CONSTRAINT PF_AMB_DOC_DESC_UK UNIQUE (C_DESCRIPCION)
;

ALTER TABLE PF_AGENTES_MOVIL
	ADD CONSTRAINT PF_AG_MOVIL_DESC_UK UNIQUE (C_DESCRIPCION)
;

ALTER TABLE PF_NIVELES_IMPORTANCIA
	ADD CONSTRAINT PF_NV_IMP_COD_NV_UK UNIQUE (C_CODIGO_NIVEL)
;

ALTER TABLE PF_NIVELES_IMPORTANCIA
	ADD CONSTRAINT PF_NV_IMP_DESC_UK UNIQUE (C_DESCRIPCION)
;

ALTER TABLE PF_PROVINCIA
	ADD CONSTRAINT PF_PROV_COD_PROV_UK UNIQUE (C_CODIGO_PROVINCIA)
;

ALTER TABLE PF_PROVINCIA
	ADD CONSTRAINT PF_PROV_NOMBRE_UK UNIQUE (C_NOMBRE)
;

--  Create Foreign Key Constraints 
ALTER TABLE PF_ACCIONES ADD CONSTRAINT PF_ACC_DOC_FK 
	FOREIGN KEY (DOC_X_DOCUMENTO) REFERENCES PF_DOCUMENTOS (X_DOCUMENTO)
;

ALTER TABLE PF_ACCIONES ADD CONSTRAINT PF_ACC_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_APLICACIONES ADD CONSTRAINT PF_APL_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_APLICACIONES ADD CONSTRAINT PF_APL_CON_FK 
	FOREIGN KEY (CON_X_CONFIGURACION) REFERENCES PF_CONFIGURACIONES (X_CONFIGURACION)
;

ALTER TABLE PF_APLICACIONES_PARAMETRO ADD CONSTRAINT PF_APAR_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_APLICACIONES_PARAMETRO ADD CONSTRAINT PF_APAR_PAR_FK 
	FOREIGN KEY (PAR_X_PARAMETRO) REFERENCES PF_PARAMETROS (X_PARAMETRO)
;

ALTER TABLE PF_COMENTARIOS ADD CONSTRAINT PF_COM_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_COMENTARIOS ADD CONSTRAINT PF_COM_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_CONFIGURACIONES ADD CONSTRAINT PF_CON_SER_FK 
	FOREIGN KEY (SER_X_SERVIDOR) REFERENCES PF_SERVIDORES (X_SERVIDOR)
;

ALTER TABLE PF_CONFIGURACIONES_PARAMETRO ADD CONSTRAINT PF_CPAR_PAR_FK 
	FOREIGN KEY (PAR_X_PARAMETRO) REFERENCES PF_PARAMETROS (X_PARAMETRO)
;

ALTER TABLE PF_CONFIGURACIONES_PARAMETRO ADD CONSTRAINT PF_CPAR_CON_FK 
	FOREIGN KEY (CON_X_CONFIGURACION) REFERENCES PF_CONFIGURACIONES (X_CONFIGURACION)
;

ALTER TABLE PF_DOCUMENTOS ADD CONSTRAINT PF_DOC_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_DOCUMENTOS ADD CONSTRAINT PF_DOC_TDOC_FK 
	FOREIGN KEY (TDOC_X_TIPO_DOCUMENTO) REFERENCES PF_TIPOS_DOCUMENTO (X_TIPO_DOCUMENTO)
;

ALTER TABLE PF_DOCUMENTOS ADD CONSTRAINT PF_DOC_ARC_FK 
	FOREIGN KEY (ARC_X_ARCHIVO) REFERENCES PF_ARCHIVOS (X_ARCHIVO)
;

ALTER TABLE PF_ETIQUETAS_PETICION ADD CONSTRAINT PF_ETPE_ETIQ_FK 
	FOREIGN KEY (ETIQ_X_ETIQUETA) REFERENCES PF_ETIQUETAS (X_ETIQUETA)
;

ALTER TABLE PF_ETIQUETAS_PETICION ADD CONSTRAINT PF_ETPE_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_ETIQUETAS_USUARIO ADD CONSTRAINT PF_ETUS_ETIQ_FK 
	FOREIGN KEY (ETIQ_X_ETIQUETA) REFERENCES PF_ETIQUETAS (X_ETIQUETA)
;

ALTER TABLE PF_ETIQUETAS_PETICION ADD CONSTRAINT PF_ETPE_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_ETIQUETAS_PETICION ADD CONSTRAINT PF_ETPE_LFIR_FK 
	FOREIGN KEY (LFIR_X_LINEA_FIRMA) REFERENCES PF_LINEAS_FIRMA (X_LINEA_FIRMA)
;

ALTER TABLE PF_ETIQUETAS_USUARIO ADD CONSTRAINT PF_ETUS_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_FILTROS ADD CONSTRAINT PF_FIL_TAUT_FK 
	FOREIGN KEY (TAUT_X_TIPO_AUTORIZACION) REFERENCES PF_TIPOS_AUTORIZACION (X_TIPO_AUTORIZACION)
;

ALTER TABLE PF_FILTROS ADD CONSTRAINT PF_FIL_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_FILTROS ADD CONSTRAINT PF_FIL_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_FILTROS_AUTORIZACION ADD CONSTRAINT PF_FAUT_FIL_FK 
	FOREIGN KEY (FIL_X_FILTRO) REFERENCES PF_FILTROS (X_FILTRO)
;

ALTER TABLE PF_FILTROS_AUTORIZACION ADD CONSTRAINT PF_FAUT_UAUT_FK 
	FOREIGN KEY (UAUT_X_USUARIO_AUTORIZACION) REFERENCES PF_USUARIOS_AUTORIZACION (X_USUARIO_AUTORIZACION)
;

ALTER TABLE PF_FIRMANTES ADD CONSTRAINT PF_FIR_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_FIRMANTES ADD CONSTRAINT PF_FIR_LFIR_FK 
	FOREIGN KEY (LFIR_X_LINEA_FIRMA) REFERENCES PF_LINEAS_FIRMA (X_LINEA_FIRMA)
;

ALTER TABLE PF_FIRMANTES ADD CONSTRAINT PF_FIR_FIR_FK 
	FOREIGN KEY (FIR_X_FIRMANTE) REFERENCES PF_FIRMANTES (X_FIRMANTE)
;

ALTER TABLE PF_FIRMANTES ADD CONSTRAINT PF_FIR_FAUT_FK 
	FOREIGN KEY (FAUT_X_FILTRO_AUTORIZACION) REFERENCES PF_FILTROS_AUTORIZACION (X_FILTRO_AUTORIZACION)
;

ALTER TABLE PF_FIRMAS ADD CONSTRAINT PF_FIRM_FIR_FK 
	FOREIGN KEY (FIR_X_FIRMANTE) REFERENCES PF_FIRMANTES (X_FIRMANTE)
;

ALTER TABLE PF_FIRMAS ADD CONSTRAINT PF_FIRM_DOC_FK 
	FOREIGN KEY (DOC_X_DOCUMENTO) REFERENCES PF_DOCUMENTOS (X_DOCUMENTO)
;

ALTER TABLE PF_FIRMAS ADD CONSTRAINT PF_FIRM_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_FIRMAS_BLOQUE ADD CONSTRAINT PF_FBLQ_FIRM_FK 
	FOREIGN KEY (FIRM_X_FIRMA) REFERENCES PF_FIRMAS (X_FIRMA)
;

ALTER TABLE PF_LINEAS_FIRMA ADD CONSTRAINT PF_LFIR_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_LINEAS_FIRMA ADD CONSTRAINT PF_LFIR_LFIR_FK 
	FOREIGN KEY (LFIR_X_LINEA_FIRMA) REFERENCES PF_LINEAS_FIRMA (X_LINEA_FIRMA)
;


ALTER TABLE PF_PETICIONES ADD CONSTRAINT PF_PET_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_PETICIONES_AVISO ADD CONSTRAINT PF_PAVI_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_PETICIONES_INFORMACION ADD CONSTRAINT PF_PEIN_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_PETICIONES_VALOR ADD CONSTRAINT PF_PEVA_PEIN_FK 
	FOREIGN KEY (PEIN_X_PETICION_INFORMACION) REFERENCES PF_PETICIONES_INFORMACION (X_PETICION_INFORMACION)
;

ALTER TABLE PF_PETICIONES_VALOR ADD CONSTRAINT PF_PEVA_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_TIPOS_DOCUMENTO ADD CONSTRAINT PF_TDOC_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_USUARIOS ADD CONSTRAINT PF_USU_PROV_FK
    FOREIGN KEY (PROV_X_PROVINCIA) REFERENCES PF_PROVINCIA(X_PROVINCIA)
;

ALTER TABLE PF_USUARIOS_VALIDADORES ADD CONSTRAINT PF_UVALIDADOR_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_VALIDADORES ADD CONSTRAINT PF_UVALIDADOR_VAL_USU_FK 
	FOREIGN KEY (USU_X_USUARIO_VALIDADOR) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_APLICACION ADD CONSTRAINT PF_UAPL_APL_FK 
	FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION)
;

ALTER TABLE PF_USUARIOS_APLICACION ADD CONSTRAINT PF_UAPL_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_AUTORIZACION ADD CONSTRAINT PF_UAUT_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_AUTORIZACION ADD CONSTRAINT PF_UAUT_USU_AUT_FK 
	FOREIGN KEY (USU_X_USUARIO_AUTORIZADO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_AUTORIZACION ADD CONSTRAINT PF_UAUT_TAUT_FK 
	FOREIGN KEY (TAUT_X_TIPO_AUTORIZACION) REFERENCES PF_TIPOS_AUTORIZACION (X_TIPO_AUTORIZACION)
;

ALTER TABLE PF_USUARIOS_CARGO ADD CONSTRAINT PF_UCAR_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_CARGO ADD CONSTRAINT PF_UCAR_USUC_FK 
	FOREIGN KEY (USU_X_USUARIO_CARGO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_EMAIL ADD CONSTRAINT PF_UMAIL_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_MOVIL ADD CONSTRAINT PF_UMOV_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_PARAMETRO ADD CONSTRAINT PF_UPAR_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_PARAMETRO ADD CONSTRAINT PF_UPAR_PAR_FK 
	FOREIGN KEY (PAR_X_PARAMETRO) REFERENCES PF_PARAMETROS (X_PARAMETRO)
;

ALTER TABLE PF_USUARIOS_PERFIL ADD CONSTRAINT PF_UPER_PER_FK 
	FOREIGN KEY (PER_X_PERFIL) REFERENCES PF_PERFILES (X_PERFIL)
;

ALTER TABLE PF_USUARIOS_PERFIL ADD CONSTRAINT PF_UPER_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_REMITENTE ADD CONSTRAINT PF_UREM_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_USUARIOS_REMITENTE ADD CONSTRAINT PF_USU_REM_GRU_FK
  FOREIGN KEY (GRU_X_GRUPO) REFERENCES PF_GRUPOS(X_GRUPO)
;

ALTER TABLE PF_OTROS_PARAMETRO ADD CONSTRAINT PF_OTPA_OTPF_FK 
	FOREIGN KEY (OTPF_X_OTRO_PFIRMA) REFERENCES PF_OTROS_PFIRMA (X_OTRO_PFIRMA)
;

ALTER TABLE PF_OTROS_PARAMETRO ADD CONSTRAINT PF_OTPA_PAR_FK 
	FOREIGN KEY (PAR_X_PARAMETRO) REFERENCES PF_PARAMETROS (X_PARAMETRO)
;

ALTER TABLE PF_USUARIOS_OTRO ADD CONSTRAINT PF_USOT_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_OTRO ADD CONSTRAINT PF_USOT_OTPF_FK 
	FOREIGN KEY (OTPF_X_OTRO_PFIRMA) REFERENCES PF_OTROS_PFIRMA (X_OTRO_PFIRMA)
;

ALTER TABLE PF_ARCHIVOS ADD CONSTRAINT PF_ARC_ARC_FK 
	FOREIGN KEY (ARC_X_ARCHIVO) REFERENCES PF_ARCHIVOS (X_ARCHIVO)
;

ALTER TABLE PF_PETICIONES_HISTORICO ADD CONSTRAINT PF_PEHI_PET_FK 
	FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION)
;

ALTER TABLE PF_PETICIONES_HISTORICO ADD CONSTRAINT PF_PEHI_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_DOCUMENTOS ADD CONSTRAINT PF_DOC_AMB_FK
  	FOREIGN KEY (AMB_X_AMBITO) REFERENCES PF_AMBITOS_DOCUMENTOS(X_AMBITO_DOCUMENTO)
;

ALTER TABLE PF_PETICIONES ADD CONSTRAINT PF_PET_NV_IMP_FK
  	FOREIGN KEY (NV_IMP_X_IMPORTANCIA) REFERENCES PF_NIVELES_IMPORTANCIA(X_NIVEL_IMPORTANCIA)
;

alter table pf_PETICIONES add constraint fk_usu_inv 
	FOREIGN KEY (usu_x_usu_inv) references pf_usuarios_invitados (x_usu_inv) initially deferred deferrable
;

ALTER TABLE PF_ADMINISTRADORES_PROVINCIAS ADD CONSTRAINT PF_USU_ADMIN_PROV_FK
    FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS(X_USUARIO)
;

ALTER TABLE PF_ADMINISTRADORES_PROVINCIAS ADD CONSTRAINT PF_PROV_ADMIN_PROV_FK
    FOREIGN KEY (PROV_X_PROVINCIA) REFERENCES PF_PROVINCIA(X_PROVINCIA)
;

ALTER TABLE PF_ATRIBUTOS_SESION ADD CONSTRAINT PF_USU_ATR_FK
  FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS(X_USUARIO);
  
--  Create Sequences
CREATE SEQUENCE PF_S_ACC
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_APL
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_APAR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_ARC
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_BLQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_COM
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_CON
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_CPAR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_DOC
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_FIL
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_FAUT
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_FIR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_FIRM
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_FBLQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_LFIR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PAR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PER
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PET
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PAVI
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_SER
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_TAUT
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_TDOC
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_USU
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_USU_VAL
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UAPL
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UAUT
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UCAR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UMAIL
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UMOV
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UPAR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UPER
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_UREM
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_ETIQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_ETUS
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_ETPE
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PEIN
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PEHI
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PEVA
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_OTPA
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_OTPF
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_USOT
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_C_HASH
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_AMBDOC
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_AG_MOV
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_NV_IMP
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_PROV
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_ADMIN_PROV
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

CREATE SEQUENCE PF_S_ATR_SES
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- CREATE TABLE qrtzpf_job_details
  -- (
    -- JOB_NAME  VARCHAR2(200) NOT NULL,
    -- JOB_GROUP VARCHAR2(200) NOT NULL,
    -- DESCRIPTION VARCHAR2(250) NULL,
    -- JOB_CLASS_NAME   VARCHAR2(250) NOT NULL, 
    -- IS_DURABLE VARCHAR2(1) NOT NULL,
    -- IS_VOLATILE VARCHAR2(1) NOT NULL,
    -- IS_STATEFUL VARCHAR2(1) NOT NULL,
    -- REQUESTS_RECOVERY VARCHAR2(1) NOT NULL,
    -- JOB_DATA BLOB NULL,
    -- PRIMARY KEY (JOB_NAME,JOB_GROUP)
-- );
-- CREATE TABLE qrtzpf_job_listeners
  -- (
    -- JOB_NAME  VARCHAR2(200) NOT NULL, 
    -- JOB_GROUP VARCHAR2(200) NOT NULL,
    -- JOB_LISTENER VARCHAR2(200) NOT NULL,
    -- PRIMARY KEY (JOB_NAME,JOB_GROUP,JOB_LISTENER),
    -- FOREIGN KEY (JOB_NAME,JOB_GROUP) 
	-- REFERENCES qrtzpf_JOB_DETAILS(JOB_NAME,JOB_GROUP)
-- );
-- CREATE TABLE qrtzpf_triggers
  -- (
    -- TRIGGER_NAME VARCHAR2(200) NOT NULL,
    -- TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    -- JOB_NAME  VARCHAR2(200) NOT NULL, 
    -- JOB_GROUP VARCHAR2(200) NOT NULL,
    -- IS_VOLATILE VARCHAR2(1) NOT NULL,
    -- DESCRIPTION VARCHAR2(250) NULL,
    -- NEXT_FIRE_TIME NUMBER(13) NULL,
    -- PREV_FIRE_TIME NUMBER(13) NULL,
    -- PRIORITY NUMBER(13) NULL,
    -- TRIGGER_STATE VARCHAR2(16) NOT NULL,
    -- TRIGGER_TYPE VARCHAR2(8) NOT NULL,
    -- START_TIME NUMBER(13) NOT NULL,
    -- END_TIME NUMBER(13) NULL,
    -- CALENDAR_NAME VARCHAR2(200) NULL,
    -- MISFIRE_INSTR NUMBER(2) NULL,
    -- JOB_DATA BLOB NULL,
    -- PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    -- FOREIGN KEY (JOB_NAME,JOB_GROUP) 
	-- REFERENCES qrtzpf_JOB_DETAILS(JOB_NAME,JOB_GROUP) 
-- );
-- CREATE TABLE qrtzpf_simple_triggers
  -- (
    -- TRIGGER_NAME VARCHAR2(200) NOT NULL,
    -- TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    -- REPEAT_COUNT NUMBER(7) NOT NULL,
    -- REPEAT_INTERVAL NUMBER(12) NOT NULL,
    -- TIMES_TRIGGERED NUMBER(7) NOT NULL,
    -- PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    -- FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
	-- REFERENCES qrtzpf_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
-- );
-- CREATE TABLE qrtzpf_cron_triggers
  -- (
    -- TRIGGER_NAME VARCHAR2(200) NOT NULL,
    -- TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    -- CRON_EXPRESSION VARCHAR2(120) NOT NULL,
    -- TIME_ZONE_ID VARCHAR2(80),
    -- PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    -- FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
	-- REFERENCES qrtzpf_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
-- );
-- CREATE TABLE qrtzpf_blob_triggers
  -- (
    -- TRIGGER_NAME VARCHAR2(200) NOT NULL,
    -- TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    -- BLOB_DATA BLOB NULL,
    -- PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
    -- FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
        -- REFERENCES qrtzpf_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
-- );
-- CREATE TABLE qrtzpf_trigger_listeners
  -- (
    -- TRIGGER_NAME  VARCHAR2(200) NOT NULL, 
    -- TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    -- TRIGGER_LISTENER VARCHAR2(200) NOT NULL,
    -- PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_LISTENER),
    -- FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP) 
	-- REFERENCES qrtzpf_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
-- );
-- CREATE TABLE qrtzpf_calendars
  -- (
    -- CALENDAR_NAME  VARCHAR2(200) NOT NULL, 
    -- CALENDAR BLOB NOT NULL,
    -- PRIMARY KEY (CALENDAR_NAME)
-- );
-- CREATE TABLE qrtzpf_paused_trigger_grps
  -- (
    -- TRIGGER_GROUP  VARCHAR2(200) NOT NULL, 
    -- PRIMARY KEY (TRIGGER_GROUP)
-- );
-- CREATE TABLE qrtzpf_fired_triggers 
  -- (
    -- ENTRY_ID VARCHAR2(95) NOT NULL,
    -- TRIGGER_NAME VARCHAR2(200) NOT NULL,
    -- TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    -- IS_VOLATILE VARCHAR2(1) NOT NULL,
    -- INSTANCE_NAME VARCHAR2(200) NOT NULL,
    -- FIRED_TIME NUMBER(13) NOT NULL,
    -- PRIORITY NUMBER(13) NULL,
    -- STATE VARCHAR2(16) NOT NULL,
    -- JOB_NAME VARCHAR2(200) NULL,
    -- JOB_GROUP VARCHAR2(200) NULL,
    -- IS_STATEFUL VARCHAR2(1) NULL,
    -- REQUESTS_RECOVERY VARCHAR2(1) NULL,
    -- PRIMARY KEY (ENTRY_ID)
-- );
-- CREATE TABLE qrtzpf_scheduler_state 
  -- (
    -- INSTANCE_NAME VARCHAR2(200) NOT NULL,
    -- LAST_CHECKIN_TIME NUMBER(13) NOT NULL,
    -- CHECKIN_INTERVAL NUMBER(13) NOT NULL,
    -- PRIMARY KEY (INSTANCE_NAME)
-- );
-- CREATE TABLE qrtzpf_locks
  -- (
    -- LOCK_NAME  VARCHAR2(40) NOT NULL, 
    -- PRIMARY KEY (LOCK_NAME)
-- );
-- INSERT INTO qrtzpf_locks values('TRIGGER_ACCESS');
-- INSERT INTO qrtzpf_locks values('JOB_ACCESS');
-- INSERT INTO qrtzpf_locks values('CALENDAR_ACCESS');
-- INSERT INTO qrtzpf_locks values('STATE_ACCESS');
-- INSERT INTO qrtzpf_locks values('MISFIRE_ACCESS');
-- create index idx_qrtzpf_j_req_recovery on qrtzpf_job_details(REQUESTS_RECOVERY);
-- create index idx_qrtzpf_t_next_fire_time on qrtzpf_triggers(NEXT_FIRE_TIME);
-- create index idx_qrtzpf_t_state on qrtzpf_triggers(TRIGGER_STATE);
-- create index idx_qrtzpf_t_nft_st on qrtzpf_triggers(NEXT_FIRE_TIME,TRIGGER_STATE);
-- create index idx_qrtzpf_t_volatile on qrtzpf_triggers(IS_VOLATILE);
-- create index idx_qrtzpf_ft_trig_name on qrtzpf_fired_triggers(TRIGGER_NAME);
-- create index idx_qrtzpf_ft_trig_group on qrtzpf_fired_triggers(TRIGGER_GROUP);
-- create index idx_qrtzpf_ft_trig_nm_gp on qrtzpf_fired_triggers(TRIGGER_NAME,TRIGGER_GROUP);
-- create index idx_qrtzpf_ft_trig_volatile on qrtzpf_fired_triggers(IS_VOLATILE);
-- create index idx_qrtzpf_ft_trig_inst_name on qrtzpf_fired_triggers(INSTANCE_NAME);
-- create index idx_qrtzpf_ft_job_name on qrtzpf_fired_triggers(JOB_NAME);
-- create index idx_qrtzpf_ft_job_group on qrtzpf_fired_triggers(JOB_GROUP);
-- create index idx_qrtzpf_ft_job_stateful on qrtzpf_fired_triggers(IS_STATEFUL);
-- create index idx_qrtzpf_ft_job_req_recovery on qrtzpf_fired_triggers(REQUESTS_RECOVERY);

-- 10/12/2009 Nuevo campo para ordenaciÃ³n de filtros v2.0.0.10

ALTER TABLE PF_FILTROS ADD (C_ORDEN NUMBER(10) DEFAULT 0 NOT NULL);

-- Create indexes

CREATE INDEX PF_I_ACC_DOC_FK ON PF_ACCIONES
(DOC_X_DOCUMENTO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ACC_ETIQ_FK ON PF_ACCIONES
(ETIQ_X_ETIQUETA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ACC_PET_FK ON PF_ACCIONES
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_APL_APL_FK ON PF_APLICACIONES
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_APL_CON_FK ON PF_APLICACIONES
(CON_X_CONFIGURACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_APAR_APL_FK ON PF_APLICACIONES_PARAMETRO
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_APAR_PAR_FK ON PF_APLICACIONES_PARAMETRO
(PAR_X_PARAMETRO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_COM_PET_FK ON PF_COMENTARIOS
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_COM_USU_FK ON PF_COMENTARIOS
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;


CREATE INDEX PF_I_CON_SER_FK ON PF_CONFIGURACIONES
(SER_X_SERVIDOR ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_CPAR_CON_FK ON PF_CONFIGURACIONES_PARAMETRO
(CON_X_CONFIGURACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_CPAR_PAR_FK ON PF_CONFIGURACIONES_PARAMETRO
(PAR_X_PARAMETRO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_DOC_PET_FK ON PF_DOCUMENTOS
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_DOC_TDOC_FK ON PF_DOCUMENTOS
(TDOC_X_TIPO_DOCUMENTO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_DOC_ARC_FK ON PF_DOCUMENTOS
(ARC_X_ARCHIVO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ETPE_PET_FK ON PF_ETIQUETAS_PETICION
(PET_X_PETICION ASC) TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ETPE_ETIQ_FK ON PF_ETIQUETAS_PETICION
(ETIQ_X_ETIQUETA ASC) TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ETPE_USU_FK ON PF_ETIQUETAS_PETICION
(USU_X_USUARIO ASC) TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ETUS_ETIQ_FK ON PF_ETIQUETAS_USUARIO
(ETIQ_X_ETIQUETA ASC) TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ETUS_USU_FK ON PF_ETIQUETAS_USUARIO
(USU_X_USUARIO ASC) TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIL_TAUT_FK ON PF_FILTROS
(TAUT_X_TIPO_AUTORIZACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIL_USU_FK ON PF_FILTROS
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIL_APL_FK ON PF_FILTROS
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FAUT_FIL_FK ON PF_FILTROS_AUTORIZACION
(FIL_X_FILTRO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FAUT_UAUT_FK ON PF_FILTROS_AUTORIZACION
(UAUT_X_USUARIO_AUTORIZACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIR_USU_FK ON PF_FIRMANTES
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIR_LFIR_FK ON PF_FIRMANTES
(LFIR_X_LINEA_FIRMA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIR_FIR_FK ON PF_FIRMANTES
(FIR_X_FIRMANTE ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIR_FAUT_FK ON PF_FIRMANTES
(FAUT_X_FILTRO_AUTORIZACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIRM_FIR_FK ON PF_FIRMAS
(FIR_X_FIRMANTE ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIRM_DOC_FK ON PF_FIRMAS
(DOC_X_DOCUMENTO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIRM_USU_FK ON PF_FIRMAS
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FIRM_VALIDO ON PF_FIRMAS
(F_VALIDO)
TABLESPACE TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FBLQ_BLQ_FK ON PF_FIRMAS_BLOQUE
(BLQ_X_BLOQUE ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_FBLQ_FIRM_FK ON PF_FIRMAS_BLOQUE
(FIRM_X_FIRMA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_LFIR_PET_FK ON PF_LINEAS_FIRMA
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_LFIR_LFIR_FK ON PF_LINEAS_FIRMA
(LFIR_X_LINEA_FIRMA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PAVI_ETIQ_FK ON PF_PETICIONES_AVISO
(ETIQ_X_ETIQUETA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PAVI_PET_FK ON PF_PETICIONES_AVISO
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PEHI_PET_FK ON PF_PETICIONES_HISTORICO
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PEIN_APL_FK ON PF_PETICIONES_INFORMACION
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PEVA_PEIN_FK ON PF_PETICIONES_VALOR
(PEIN_X_PETICION_INFORMACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PEVA_PET_FK ON PF_PETICIONES_VALOR
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_TDOC_APL_FK ON PF_TIPOS_DOCUMENTO
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UAPL_APL_FK ON PF_USUARIOS_APLICACION
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UAPL_USU_FK ON PF_USUARIOS_APLICACION
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UAUT_USU_AUT_FK ON PF_USUARIOS_AUTORIZACION
(USU_X_USUARIO_AUTORIZADO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PROV_ADMIN_PROV_FK ON PF_ADMINISTRADORES_PROVINCIAS(PROV_X_PROVINCIA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_USU_ADMIN_PROV_FK ON PF_ADMINISTRADORES_PROVINCIAS(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UAUT_USU_FK ON PF_USUARIOS_AUTORIZACION
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UAUT_TAUT_FK ON PF_USUARIOS_AUTORIZACION
(TAUT_X_TIPO_AUTORIZACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UCAR_USUC_FK ON PF_USUARIOS_CARGO
(USU_X_USUARIO_CARGO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UCAR_USU_FK ON PF_USUARIOS_CARGO
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UMAIL_USU_FK ON PF_USUARIOS_EMAIL
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UMOV_USU_FK ON PF_USUARIOS_MOVIL
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UPAR_PAR_FK ON PF_USUARIOS_PARAMETRO
(PAR_X_PARAMETRO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UPAR_USU_FK ON PF_USUARIOS_PARAMETRO
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UPER_PER_FK ON PF_USUARIOS_PERFIL
(PER_X_PERFIL ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UPER_USU_FK ON PF_USUARIOS_PERFIL
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UREM_PET_FK ON PF_USUARIOS_REMITENTE
(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_UREM_USU_FK ON PF_USUARIOS_REMITENTE
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_OTPA_PAR_FK ON PF_OTROS_PARAMETRO
(PAR_X_PARAMETRO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_OTPA_OTPF_FK ON PF_OTROS_PARAMETRO
(OTPF_X_OTRO_PFIRMA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_USOT_OTPF_FK ON PF_USUARIOS_OTRO
(OTPF_X_OTRO_PFIRMA ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_USOT_USU_FK ON PF_USUARIOS_OTRO
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_ARC_ARC_FK ON PF_ARCHIVOS
(ARC_X_ARCHIVO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_PEHI_USU_FK ON PF_PETICIONES_HISTORICO
(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_AMB_DOC_FK ON PF_DOCUMENTOS
(AMB_X_AMBITO ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

CREATE INDEX PF_I_NV_IMP_FK ON PF_PETICIONES(NV_IMP_X_IMPORTANCIA ASC)
TABLESPACE  TS_PFIRMA_INDICES;

CREATE INDEX PF_I_PROV_FK ON PF_USUARIOS(PROV_X_PROVINCIA ASC)
TABLESPACE  TS_PFIRMA_INDICES;

CREATE INDEX PF_USU_ATR_FK ON PF_ATRIBUTOS_SESION(USU_X_USUARIO ASC)
	TABLESPACE  TS_PFIRMA_INDICES;
	

CREATE INDEX PF_I_PET_APL_FK ON PF_PETICIONES
(APL_X_APLICACION ASC)
TABLESPACE  TS_PFIRMA_INDICES
;

-- PF_MENSAJES --
CREATE TABLE PF_MENSAJES (
X_MENSAJE NUMBER(10) NOT NULL, 
C_CREADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL, 
F_CREADO DATE DEFAULT SYSDATE  NOT NULL, 
C_MODIFICADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL, 
F_MODIFICADO DATE DEFAULT SYSDATE  NOT NULL, 
D_ASUNTO VARCHAR2(1020 CHAR) NOT NULL, 
T_TEXTO CLOB,
F_INICIO DATE DEFAULT SYSDATE  NOT NULL, 
F_CADUCIDAD DATE,
AMB_X_AMBITO_MENSAJE NUMBER(10),
PROV_X_PROVINCIA NUMBER(10),
USU_X_USUARIO NUMBER(10),
CONSTRAINT PF_MEN_PK PRIMARY KEY (X_MENSAJE),
CONSTRAINT PF_MEN_AMB_FK FOREIGN KEY (AMB_X_AMBITO_MENSAJE) REFERENCES PF_AMBITOS_MENSAJES (X_AMBITO_MENSAJE),
CONSTRAINT PF_MEN_PROV_FK FOREIGN KEY (PROV_X_PROVINCIA) REFERENCES PF_PROVINCIA (X_PROVINCIA),
CONSTRAINT PF_MEN_USU_FK FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO));


COMMENT ON TABLE PF_MENSAJES IS 'Mensjes de los administradores a los usuarios';
COMMENT ON COLUMN PF_MENSAJES.X_MENSAJE IS 'Clave primaria';
COMMENT ON COLUMN PF_MENSAJES.C_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_MENSAJES.F_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_MENSAJES.C_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_MENSAJES.F_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_MENSAJES.D_ASUNTO IS 'Asunto del mensaje';
COMMENT ON COLUMN PF_MENSAJES.T_TEXTO IS 'Texto del mensaje';
COMMENT ON COLUMN PF_MENSAJES.F_INICIO IS 'Fecha de inicio del mensaje';
COMMENT ON COLUMN PF_MENSAJES.F_CADUCIDAD IS 'Fecha de caducidad del mensaje';
COMMENT ON COLUMN PF_MENSAJES.AMB_X_AMBITO_MENSAJE IS 'Ambito de difusion del mensaje';
COMMENT ON COLUMN PF_MENSAJES.PROV_X_PROVINCIA IS 'Provincia de difusion del mensaje';
COMMENT ON COLUMN PF_MENSAJES.USU_X_USUARIO IS 'Usuario de difusion del mensaje';


CREATE SEQUENCE "PFIRMAMG"."PF_S_MEN" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY
1 START WITH 1 NOCACHE NOORDER NOCYCLE;



CREATE TABLE
PF_USUARIOS_COMENTARIO
(
	X_USUARIO_COMENTARIO NUMBER(10) NOT NULL,
	C_CREADO VARCHAR2(20 CHAR) DEFAULT 'USER ' NOT NULL,
	F_CREADO DATE DEFAULT SYSDATE NOT NULL,
	C_MODIFICADO VARCHAR2(20 CHAR) DEFAULT 'USER ' NOT NULL,
	F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,
	COM_X_COMENTARIO NUMBER(10) NOT NULL,
	USU_X_USUARIO NUMBER(10) NOT NULL,
	CONSTRAINT PF_UCOM_PK PRIMARY KEY (X_USUARIO_COMENTARIO),
	CONSTRAINT PF_UCOM_COM_FK FOREIGN KEY (COM_X_COMENTARIO) REFERENCES PF_COMENTARIOS
	(X_COMENTARIO),
	CONSTRAINT PF_UCOM_USU_FK FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
)
TABLESPACE  TS_PFIRMA_DATOS;

COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.X_USUARIO_COMENTARIO
IS
    'Clave primaria';
COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.C_CREADO
IS
    'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.F_CREADO
IS
    'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.C_MODIFICADO
IS
    'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.F_MODIFICADO
IS
    'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.COM_X_COMENTARIO
IS
    'Clave ajena a PF_COMENTARIOS';
COMMENT ON COLUMN PF_USUARIOS_COMENTARIO.USU_X_USUARIO
IS
    'Clave ajena a PF_USUARIOS';
    
CREATE SEQUENCE PF_S_UCOM
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- PF_USUARIOS_MENSAJE --
CREATE TABLE
    PF_USUARIOS_MENSAJE
    (
        X_USUARIO_MENSAJE NUMBER(10) NOT NULL,
        C_CREADO VARCHAR2(20) DEFAULT 'USER' NOT NULL,
        F_CREADO DATE DEFAULT SYSDATE NOT NULL,
        C_MODIFICADO VARCHAR2(20) DEFAULT 'USER' NOT NULL,
        F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,
        MEN_X_MENSAJE NUMBER(10) NOT NULL,
        USU_X_USUARIO NUMBER(10) NOT NULL,
        ETIQ_X_ETIQUETA NUMBER(10) NOT NULL,
        CONSTRAINT PF_UMEN_PK PRIMARY KEY (X_USUARIO_MENSAJE),
        CONSTRAINT PF_UMEN_MEN_FK FOREIGN KEY (MEN_X_MENSAJE) REFERENCES PF_MENSAJES (X_MENSAJE),
        CONSTRAINT PF_UMEN_USU_FK FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO),
        CONSTRAINT PF_UMEN_ETIQ_FK FOREIGN KEY (ETIQ_X_ETIQUETA) REFERENCES PF_ETIQUETAS (X_ETIQUETA)
    );

COMMENT ON COLUMN PF_USUARIOS_MENSAJE.X_USUARIO_MENSAJE IS 'Clave primaria';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.C_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.F_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.C_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.F_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.MEN_X_MENSAJE IS 'Clave ajena a PF_MENSAJES';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.USU_X_USUARIO IS 'Clave ajena a PF_USUARIOS';
COMMENT ON COLUMN PF_USUARIOS_MENSAJE.ETIQ_X_ETIQUETA IS 'Clave ajena a PF_ETIQUETAS';

CREATE SEQUENCE "PFIRMAMG"."PF_S_UMEN" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY
1 START WITH 1 NOCACHE NOORDER NOCYCLE;

-- PF_APLICACIONES_METADATOS
CREATE TABLE PF_APLICACIONES_METADATOS (
X_APLICACION_METADATOS NUMBER(10),
D_NOMBRE VARCHAR2(400 CHAR) NOT NULL, 
D_VALOR VARCHAR2(400 CHAR), 
L_ENI VARCHAR2(4 CHAR) DEFAULT 'S'  NOT NULL, 
L_OBLIGATORIO VARCHAR2(4 CHAR) DEFAULT 'S'  NOT NULL, 
C_CREADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL, 
F_CREADO DATE DEFAULT SYSDATE  NOT NULL, 
C_MODIFICADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL, 
F_MODIFICADO DATE DEFAULT SYSDATE  NOT NULL, 
APL_X_APLICACION NUMBER(10), 
CONSTRAINT PF_AMETA_PK PRIMARY KEY (X_APLICACION_METADATOS));

COMMENT ON TABLE PF_APLICACIONES_METADATOS IS 'Metadatos ENI de las aplicaciones';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.X_APLICACION_METADATOS IS 'Clave primaria';

COMMENT ON COLUMN PF_APLICACIONES_METADATOS.D_NOMBRE IS 'Nombre del metadato';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.D_VALOR IS 'Valor del metadato';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.L_ENI IS 'Indica si el metadato es ENI o es adicional';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.L_OBLIGATORIO IS 'Indica si el metadato es obligatorio u opcional';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.C_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.F_CREADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.C_MODIFICADO IS 'Campo de auditoria';
COMMENT ON COLUMN PF_APLICACIONES_METADATOS.F_MODIFICADO IS 'Campo de auditoria';

ALTER TABLE PF_APLICACIONES_METADATOS ADD CONSTRAINT PF_AMETA_APLI_FK FOREIGN KEY (APL_X_APLICACION) REFERENCES PF_APLICACIONES (X_APLICACION);
ALTER TABLE PF_APLICACIONES_METADATOS ADD CONSTRAINT PF_AMETA_L_OBLIGATORIO_CH CHECK (L_OBLIGATORIO IN ('S','N'));
ALTER TABLE PF_APLICACIONES_METADATOS ADD CONSTRAINT PF_AMETA_L_ENI_CH CHECK (L_ENI IN ('S','N'));


CREATE SEQUENCE "PFIRMAMG"."PF_S_AMETA" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY
1 START WITH 1 NOCACHE NOORDER NOCYCLE;
   
  


-------------------- 17-09-2012 -------------------------------

---------------- CREACIÃ“N DE LA TABLA DE GRUPOS ---------------



ALTER TABLE PF_GRUPOS ADD CONSTRAINT PF_GRUP_PROV_FK
  FOREIGN KEY (PROV_X_PROVINCIA) REFERENCES PF_PROVINCIA(X_PROVINCIA); 

-- Primary Key
ALTER TABLE PF_USUARIOS_GRUPOS ADD CONSTRAINT PF_USU_GRUP_PK 
	PRIMARY KEY (X_USUARIO_GRUPO) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

-- Foreign Keys
ALTER TABLE PF_USUARIOS_GRUPOS ADD CONSTRAINT PF_USU_USU_GRU_FK
  FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS(X_USUARIO);
ALTER TABLE PF_USUARIOS_GRUPOS ADD CONSTRAINT PF_GRU_USU_GRU_FK
  FOREIGN KEY (GRU_X_GRUPO) REFERENCES PF_GRUPOS(X_GRUPO);

CREATE SEQUENCE PF_S_USU_GRU
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- Se crean los Ã­ndices
CREATE INDEX PF_I_USU_USU_GRU_FK ON PF_USUARIOS_GRUPOS(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES;
CREATE INDEX PF_I_GRU_USU_GRU_FK ON PF_USUARIOS_GRUPOS(GRU_X_GRUPO ASC)
TABLESPACE  TS_PFIRMA_INDICES;


  

ALTER TABLE PF_PLANTILLA_PETICION ADD CONSTRAINT PF_PLANTILLA_PK 
	PRIMARY KEY (X_PLANTILLA_PETICION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

CREATE SEQUENCE PF_S_PLAN
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

--Se elimina para que se pueda repetir el nombre de la plantilla por varios usuarios
--ALTER TABLE PF_PLANTILLA_PETICION
--	ADD CONSTRAINT PF_PLAN_COD_PLAN_UK UNIQUE (C_CODIGO_PLANTILLA)
--;

ALTER TABLE PF_PLANTILLA_PETICION ADD CONSTRAINT PF_PLAN_USU_FK
  FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS(X_USUARIO);

-- Se crea el Indice
CREATE INDEX PF_I_USU_FK ON PF_PLANTILLA_PETICION(USU_X_USUARIO ASC)
TABLESPACE  TS_PFIRMA_INDICES;

-- Modelo de InterfazGenerica

-- OBJETOS COMO SISTEMA PORTAFIRMAS

-- TABLA PF_DOCELWEB_GESTOR

CREATE TABLE PF_DOCELWEB_GESTOR
    (
        X_SISTEMA_GESTOR NUMBER(10) NOT NULL,
		C_CREADO VARCHAR2(20) DEFAULT USER NOT NULL,    	--  Campo de auditoria
		F_CREADO DATE DEFAULT SYSDATE NOT NULL,    			--  Campo de auditoria
		C_MODIFICADO VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
		F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,    		--  Campo de auditoria        
        D_SISTEMA_GESTOR VARCHAR2(50 CHAR) NOT NULL,
        D_TIPO_AUTH_WSS VARCHAR2(20 CHAR) DEFAULT 'UserNameToken' NOT NULL,
        D_PASSWORD_WSS VARCHAR2(20 CHAR)
    )
TABLESPACE TS_PFIRMA_DATOS;

ALTER TABLE PF_DOCELWEB_GESTOR ADD CONSTRAINT PF_DOCELWEB_GESTOR_PK 
	PRIMARY KEY (X_SISTEMA_GESTOR) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
	
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.X_SISTEMA_GESTOR  	IS 'Clave primaria';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.C_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.F_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.C_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.F_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.D_SISTEMA_GESTOR  	IS 'Nombre del sistema gestor y usuario WSS';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.D_TIPO_AUTH_WSS   	IS 'Tipo de autenticaciÃ³n WSS (UserNameToken, BinarySecurityToken)';
COMMENT ON COLUMN PF_DOCELWEB_GESTOR.D_PASSWORD_WSS    	IS 'ContraseÃ±a WSS para UserNameToken';

CREATE SEQUENCE PF_S_DOCELWEB_GESTOR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- TABLA PF_DOCELWEB_SOLICITUD_SPFIRMA

CREATE TABLE PF_DOCELWEB_SOLICITUD_SPFIRMA
    (
        X_ID_TRANSACCION NUMBER(10) NOT NULL,
		C_CREADO VARCHAR2(20) DEFAULT USER NOT NULL,    	--  Campo de auditoria
		F_CREADO DATE DEFAULT SYSDATE NOT NULL,    			--  Campo de auditoria
		C_MODIFICADO VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
		F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,    		--  Campo de auditoria              
        D_ESTADO CHAR(1) DEFAULT 'A' NOT NULL,
        D_DESCRIPCION VARCHAR2(255 CHAR),
        D_PRIORIDAD CHAR(1) DEFAULT 'N' NOT NULL,
        D_FORMATO_FIRMA VARCHAR2(5 CHAR) DEFAULT 'CADES' NOT NULL,
        D_VERSION_XADES VARCHAR2(5 CHAR),
        D_TIPO_MULTIFIRMA VARCHAR2(10 CHAR) DEFAULT 'NO' NOT NULL,
        F_FECHA_LIMITE DATE,
        D_REMITENTE VARCHAR2(100 CHAR) NOT NULL,
        SOLICITUD_X_GESTOR NUMBER(10) NOT NULL,
        SOLICITUD_X_PETICION NUMBER(10)
    )
TABLESPACE TS_PFIRMA_DATOS;    
    
ALTER TABLE PF_DOCELWEB_SOLICITUD_SPFIRMA ADD CONSTRAINT PF_DOCELWEB_SOLICITUD_SPFIR_PK 
    PRIMARY KEY (X_ID_TRANSACCION) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
ALTER TABLE PF_DOCELWEB_SOLICITUD_SPFIRMA ADD CONSTRAINT PF_DOCELWEB_SOL_GES_FK
	FOREIGN KEY (SOLICITUD_X_GESTOR) REFERENCES PF_DOCELWEB_GESTOR (X_SISTEMA_GESTOR);
ALTER TABLE PF_DOCELWEB_SOLICITUD_SPFIRMA ADD CONSTRAINT PF_DOCELWEB_SOL_PET_FK
	FOREIGN KEY (SOLICITUD_X_PETICION) REFERENCES PF_PETICIONES (X_PETICION);	
	
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.X_ID_TRANSACCION  		IS 'Clave primaria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.C_CREADO             	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.F_CREADO              	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.C_MODIFICADO         	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.F_MODIFICADO          	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_ESTADO  	        	IS 'Estado de la solicitud (N: Alta, P: Pendiente, A: Anulada, F: Firmada, R: Rechazada)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_DESCRIPCION  	    	IS 'DescripciÃ³n de la solicitud';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_PRIORIDAD   	    	IS 'Prioridad de la solicitud (N: Normal, A: Alta)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_FORMATO_FIRMA     	IS 'Formato de firma (CADES, XADES, PADES)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_VERSION_XADES         IS 'VersiÃ³n de firma XADES (1.2.2, 1.3.2)';	
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_TIPO_MULTIFIRMA       IS 'Tipo de multifirma (NO, SERIE, PARALELO)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.F_FECHA_LIMITE    		IS 'Fecha lÃ­mite de la solicitud (Solo informativa)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.D_REMITENTE    	        IS 'Nombre y apellidos del remitente';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.SOLICITUD_X_GESTOR      IS 'Identificador del sistema de gestiÃ³n que enviÃ³ la solicitud';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SPFIRMA.SOLICITUD_X_PETICION    IS 'Identificador de la peticiÃ³n asociada a la solicitud una vez registrada';

CREATE SEQUENCE PF_S_DOCELWEB_SOL_SPFIR
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- TABLA PF_DOCELWEB_LISTA_FIRMANTES

CREATE TABLE PF_DOCELWEB_X_LISTA_FIRMANTES
    (
        X_ID_TRANSACCION NUMBER(10) NOT NULL,
        X_USUARIO NUMBER(10) NOT NULL        
    )
TABLESPACE TS_PFIRMA_DATOS;    

ALTER TABLE PF_DOCELWEB_X_LISTA_FIRMANTES ADD CONSTRAINT PF_DOCELWEB_X_LIST_FIR_PK 
    PRIMARY KEY (X_ID_TRANSACCION, X_USUARIO) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
ALTER TABLE PF_DOCELWEB_X_LISTA_FIRMANTES ADD CONSTRAINT PF_DOCELWEB_X_REQ_FK
	FOREIGN KEY (X_ID_TRANSACCION) REFERENCES PF_DOCELWEB_SOLICITUD_SPFIRMA (X_ID_TRANSACCION);    
ALTER TABLE PF_DOCELWEB_X_LISTA_FIRMANTES ADD CONSTRAINT PF_DOCELWEB_X_FIR_FK
	FOREIGN KEY (X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO);	
	
COMMENT ON COLUMN PF_DOCELWEB_X_LISTA_FIRMANTES.X_ID_TRANSACCION  	IS 'Clave primaria, Clave ajena hacia PF_DOCELWEB_SOLICITUD_SPFIRMA';
COMMENT ON COLUMN PF_DOCELWEB_X_LISTA_FIRMANTES.X_USUARIO  			IS 'Clave primaria, Clave ajena hacia PF_USUARIOS';

-- TABLA PF_DOCELWEB_DOCUMENTO

CREATE TABLE PF_DOCELWEB_DOCUMENTO
    (
        X_DOCUMENTO NUMBER(10) NOT NULL,
        C_CREADO VARCHAR2(20) NOT NULL,
        F_CREADO DATE DEFAULT SYSDATE NOT NULL,
        C_MODIFICADO VARCHAR2(20) NOT NULL,
        F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,
        D_DESCRIPCION VARCHAR2(255 CHAR) NOT NULL,
        D_RUTA_DOCUMENTO VARCHAR2(255 CHAR) NOT NULL,
        D_TIPO_DOCEL CHAR(1) NOT NULL,
        D_REQ_FIRMA CHAR(1) DEFAULT 'N' NOT NULL,
        D_DISPOSICION_URL VARCHAR2(500 CHAR),
        DOC_X_ARCHIVO NUMBER(10),
        DOC_X_SOLICITUD NUMBER(10) NOT NULL,
        DOC_X_PFDOC NUMBER(10)
    )
TABLESPACE TS_PFIRMA_DATOS; 
    
ALTER TABLE PF_DOCELWEB_DOCUMENTO ADD CONSTRAINT PF_DOCELWEB_DOCUMENTO_PK 
    PRIMARY KEY (X_DOCUMENTO) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
ALTER TABLE PF_DOCELWEB_DOCUMENTO ADD CONSTRAINT PF_DOCELWEB_DOC_ARCH_FK 
	FOREIGN KEY (DOC_X_ARCHIVO) REFERENCES PF_ARCHIVOS (X_ARCHIVO);
ALTER TABLE PF_DOCELWEB_DOCUMENTO ADD CONSTRAINT PF_DOCELWEB_DOC_SOL_FK 
	FOREIGN KEY (DOC_X_SOLICITUD) REFERENCES PF_DOCELWEB_SOLICITUD_SPFIRMA (X_ID_TRANSACCION);
ALTER TABLE PF_DOCELWEB_DOCUMENTO ADD CONSTRAINT PF_DOCELWEB_DOC_PFDOC_FK 
	FOREIGN KEY (DOC_X_PFDOC) REFERENCES PF_DOCUMENTOS (X_DOCUMENTO);	

COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.X_DOCUMENTO  		IS 'Clave primaria';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.C_CREADO            IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.F_CREADO            IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.C_MODIFICADO        IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.F_MODIFICADO        IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.D_DESCRIPCION  	    IS 'DescriciÃ³n del documento';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.D_RUTA_DOCUMENTO  	IS 'Carpetas y nombre del documento';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.D_TIPO_DOCEL  	    IS 'Tipo de documento (E: Documento electrÃ³nico, U: Puesta a disposiciÃ³n/URL, P: Documento en papel)';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.D_REQ_FIRMA  	    IS 'Indica si requiere firma (S/N). Obligatorio N para documentos en papel';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.D_DISPOSICION_URL  	IS 'URL de la puesta a disposiciÃ³n';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.DOC_X_ARCHIVO  	    IS 'Contenido del documento almacenado en el gestor documental de portafirmas';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.DOC_X_SOLICITUD   	IS 'Solicitud de InterfazGenerica propietaria del documento registrado';
COMMENT ON COLUMN PF_DOCELWEB_DOCUMENTO.DOC_X_PFDOC  	    IS 'Documento de portafirmas relacionado con el documento de InterfazGenerica una vez registrada la peticiÃ³n asociada al mismo';

CREATE SEQUENCE PF_S_DOCELWEB_DOCUMENTO
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- OBJETOS COMO SISTEMA DE GESTION

-- TABLA PF_DOCELWEB_PFIRMA

CREATE TABLE PF_DOCELWEB_PFIRMA
    (
        X_PFIRMA NUMBER(10) NOT NULL,
		C_CREADO VARCHAR2(20) DEFAULT USER NOT NULL,    	--  Campo de auditoria
		F_CREADO DATE DEFAULT SYSDATE NOT NULL,    			--  Campo de auditoria
		C_MODIFICADO VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
		F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,    		--  Campo de auditoria        
        D_SISTEMA_PFIRMA VARCHAR2(50 CHAR) NOT NULL,
        D_TIPO_AUTH_WSS VARCHAR2(20 CHAR) DEFAULT 'UserNameToken' NOT NULL,
        D_PASSWORD_WSS VARCHAR2(20 CHAR)
    )
TABLESPACE TS_PFIRMA_DATOS;

ALTER TABLE PF_DOCELWEB_PFIRMA ADD CONSTRAINT PF_DOCELWEB_PFIRMA_PK 
	PRIMARY KEY (X_PFIRMA) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
	
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.X_PFIRMA  			IS 'Clave primaria';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.C_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.F_CREADO           IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.C_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.F_MODIFICADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.D_SISTEMA_PFIRMA  	IS 'Nombre del sistema portafirmas y usuario WSS';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.D_TIPO_AUTH_WSS   	IS 'Tipo de autenticaciÃ³n WSS (UserNameToken, BinarySecurityToken)';
COMMENT ON COLUMN PF_DOCELWEB_PFIRMA.D_PASSWORD_WSS    	IS 'ContraseÃ±a WSS para UserNameToken';

CREATE SEQUENCE PF_S_DOCELWEB_PFIRMA
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- TABLA PF_DOCELWEB_SOLICITUD_SGESTION

CREATE TABLE PF_DOCELWEB_SOLICITUD_SGESTION
    (
    	X_ID NUMBER(10) NOT NULL,
		C_CREADO VARCHAR2(20) DEFAULT USER NOT NULL,    	--  Campo de auditoria
		F_CREADO DATE DEFAULT SYSDATE NOT NULL,    			--  Campo de auditoria
		C_MODIFICADO VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
		F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,    		--  Campo de auditoria              
        D_ID_TRANSACTION NUMBER(10) NOT NULL,
        SOLICITUD_X_PFIRMA NUMBER(10) NOT NULL,        
        D_ESTADO CHAR(1) DEFAULT 'N' NOT NULL,
        D_DESCRIPCION VARCHAR2(255 CHAR),
        D_PRIORIDAD CHAR(1) DEFAULT 'N' NOT NULL,
        L_DEVOLUCION_SOLICITUD CHAR(1) DEFAULT 'N' NOT NULL
    )
TABLESPACE TS_PFIRMA_DATOS;
    
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD CONSTRAINT PF_DOCELWEB_SOLICITUD_SGEST_PK 
    PRIMARY KEY (X_ID) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD CONSTRAINT PF_DOCELWEB_SOL_SGEST_UNIQUE 
    UNIQUE (D_ID_TRANSACTION, SOLICITUD_X_PFIRMA) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD CONSTRAINT PF_DOCELWEB_SOL_PFIRMA_FK
	FOREIGN KEY (SOLICITUD_X_PFIRMA) REFERENCES PF_DOCELWEB_PFIRMA (X_PFIRMA);
	
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.X_ID  					IS 'Clave primaria';	
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.C_CREADO             	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.F_CREADO              	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.C_MODIFICADO         	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.F_MODIFICADO          	IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.D_ID_TRANSACTION     	IS 'Identificador de transacciÃ³n devuelto por el sistema portafirmas';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.SOLICITUD_X_PFIRMA     IS 'Identificador del sistema de portafirmas al que se ha enviado la solicitud';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.D_ESTADO  	        	IS 'Estado de la solicitud (N: Alta, P: Pendiente, A: Anulada, F: Firmada, R: Rechazada)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.D_DESCRIPCION  	    IS 'DescripciÃ³n de la solicitud';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.D_PRIORIDAD   	    	IS 'Prioridad de la solicitud (N: Normal, A: Alta)';
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.L_DEVOLUCION_SOLICITUD	IS 'Caracter booleano que indica si se ha recibido la devoluciÃ³n de las solicitud (estados F o R) desde el sistema portafirmas';

CREATE SEQUENCE PF_S_DOCELWEB_SOL_SGEST
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- TABLA PF_DOCELWEB_SM_DOC

CREATE TABLE PF_DOCELWEB_SM_DOC
    (
        X_SM_DOC NUMBER(10) NOT NULL,
		C_CREADO VARCHAR2(20) DEFAULT USER NOT NULL,    	--  Campo de auditoria
		F_CREADO DATE DEFAULT SYSDATE NOT NULL,    			--  Campo de auditoria
		C_MODIFICADO VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria
		F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,    		--  Campo de auditoria
		X_DOCUMENTO NUMBER(10) NOT NULL,
		D_DESCRIPCION VARCHAR2(255 CHAR) NOT NULL,
		X_SM_REQUEST NUMBER(10) NOT NULL
    )
TABLESPACE TS_PFIRMA_DATOS;    

ALTER TABLE PF_DOCELWEB_SM_DOC ADD CONSTRAINT PF_DOCELWEB_SM_DOC_PK 
    PRIMARY KEY (X_SM_DOC) USING INDEX TABLESPACE TS_PFIRMA_INDICES;
ALTER TABLE PF_DOCELWEB_SM_DOC ADD CONSTRAINT PF_DOCELWEB_SM_REQ_FK
	FOREIGN KEY (X_SM_REQUEST) REFERENCES PF_DOCELWEB_SOLICITUD_SGESTION (X_ID);
	
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.X_SM_DOC  		IS 'Clave primaria';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.C_CREADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.F_CREADO       IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.C_MODIFICADO   IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.F_MODIFICADO   IS 'Campo de auditoria';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.X_DOCUMENTO  	IS 'Identificador de registro de documento en el Sistema Portafirmas';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.D_DESCRIPCION	IS 'DescripciÃ³n del documento registrado en el sistema portafirmas';
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.X_SM_REQUEST  	IS 'Clave ajena de la solicitud del sistema de gestiÃ³n asociada';

CREATE SEQUENCE PF_S_DOCELWEB_SM_DOC
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;



-- Primary Key
ALTER TABLE PF_EMAILS_PETICION ADD CONSTRAINT PF_EMA_PET_PK 
	PRIMARY KEY (X_EMAIL_PETICION) USING INDEX TABLESPACE TS_PFIRMA_INDICES
;

-- Foreign Keys
ALTER TABLE PF_EMAILS_PETICION ADD CONSTRAINT PF_EMA_PET_PET_FK
  FOREIGN KEY (PET_X_PETICION) REFERENCES PF_PETICIONES(X_PETICION);
  

CREATE SEQUENCE PF_S_EMA_PET
INCREMENT BY 1
START WITH 1
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;

-- Se crean los Ã­ndices
CREATE INDEX PF_I_EMA_PET_PET_FK ON PF_EMAILS_PETICION(PET_X_PETICION ASC)
TABLESPACE  TS_PFIRMA_INDICES;

ALTER TABLE PF_ETIQUETAS_PETICION 
ADD (GRO_X_GROUP NUMBER(10) );

COMMENT ON COLUMN PF_ETIQUETAS_PETICION.GRO_X_GROUP IS 'En caso que se asigne la etiqueta estando en un grupo, se llena este campo';

ALTER TABLE PF_ETIQUETAS_PETICION
ADD CONSTRAINT PF_ETIQUETAS_PETICION_FK1 FOREIGN KEY
(
  GRO_X_GROUP 
)
REFERENCES PF_GRUPOS
(
  X_GRUPO 
)
ENABLE;

ALTER TABLE PF_GRUPOS
ADD CONSTRAINT PF_GRUPO_NOMBRE_UK UNIQUE 
(
  C_NOMBRE 
, PROV_X_PROVINCIA 
)
USING INDEX 
(
    CREATE UNIQUE INDEX PF_GRUPO_NOMBRE_UK ON PF_GRUPOS (C_NOMBRE ASC, PROV_X_PROVINCIA ASC) 
)
 ENABLE;
 
ALTER TABLE PF_DOCUMENTOS 
ADD (USU_X_USUARIO_ANEXA NUMBER(10) );

ALTER TABLE PF_DOCUMENTOS
ADD CONSTRAINT PF_DOCUMENTOS_FK1 FOREIGN KEY
(
  USU_X_USUARIO_ANEXA 
)
REFERENCES PF_USUARIOS
(
  X_USUARIO 
)
ENABLE;

COMMENT ON COLUMN PF_DOCUMENTOS.USU_X_USUARIO_ANEXA IS 'Indica el usuario que lo ha anexado';

CREATE TABLE PF_USUARIOS_DOC_VISIBLES 
(
  USU_X_USUARIO NUMBER(10) NOT NULL 
, DOC_X_DOCUMENTO NUMBER(10) NOT NULL 
, CONSTRAINT PF_USUARIOS_DOC_VISIBLES_PK PRIMARY KEY 
  (
    USU_X_USUARIO 
  , DOC_X_DOCUMENTO 
  )
  ENABLE 
);

ALTER TABLE PF_USUARIOS_DOC_VISIBLES
ADD CONSTRAINT PF_USUARIOS_DOC_VISIBLES_FK1 FOREIGN KEY
(
  DOC_X_DOCUMENTO 
)
REFERENCES PF_DOCUMENTOS
(
  X_DOCUMENTO 
)
ENABLE;

ALTER TABLE PF_USUARIOS_DOC_VISIBLES
ADD CONSTRAINT PF_USUARIOS_DOC_VISIBLES_FK2 FOREIGN KEY
(
  USU_X_USUARIO 
)
REFERENCES PF_USUARIOS
(
  X_USUARIO 
)
ENABLE;

ALTER TABLE PF_APLICACIONES 
ADD (VISIBLE_EN_PORTAFIRMA_WEB NUMBER DEFAULT 0 NOT NULL);

COMMENT ON COLUMN PF_APLICACIONES.VISIBLE_EN_PORTAFIRMA_WEB IS 'Indica si esta aplicacion es visible en la pantalla del portafirmas';

ALTER TABLE PF_APLICACIONES 
ADD (DESCRIPCION_WEB VARCHAR2(50 CHAR) );

COMMENT ON COLUMN PF_APLICACIONES.DESCRIPCION_WEB IS 'Es el texto que aparecera en la pantalla';

ALTER TABLE PF_ADMINISTRADORES_PROVINCIAS 
ADD (ES_SEDE_PRINCIPAL NUMBER DEFAULT 1 NOT NULL);

COMMENT ON COLUMN PF_ADMINISTRADORES_PROVINCIAS.ES_SEDE_PRINCIPAL IS 'Define para los administradores de organismo, si esta sede se puede eliminar o no.';

ALTER TABLE PF_PROVINCIA 
ADD (PROVINCIA_PADRE NUMBER );

COMMENT ON COLUMN PF_PROVINCIA.PROVINCIA_PADRE IS 'En caso de ser creada como administrador de organismo, esta es la sede de la cual es derivada';

ALTER TABLE PF_PROVINCIA
ADD CONSTRAINT PF_PROVINCIA_FK2 FOREIGN KEY
(
  PROVINCIA_PADRE 
)
REFERENCES PF_PROVINCIA
(
  X_PROVINCIA 
)
ENABLE;

alter table pf_usuarios add
   (
   l_notify_push varchar2(1) default 'N' NULL
   );
   
   COMMENT ON COLUMN PF_USUARIOS.L_NOTIFY_PUSH IS 'Habilitar notificaciones PUSH';
   
   
   


 CREATE SEQUENCE "PF_S_USU_INV" INCREMENT BY 1 MAXVALUE 999999999999999999999999999 MINVALUE 1 NOCACHE;
 
  alter table pf_firmantes modify USU_X_USUARIO NUMBER(10,0) NULL;
  
  ALTER TABLE PF_FIRMAS ADD (L_MOVIL VARCHAR2(1) DEFAULT 'N');
	COMMENT ON COLUMN PF_FIRMAS.L_MOVIL IS 'Informa si la firma se ha realizado por la aplicación móvil.';








--------------------------------------------------------
--  DDL for Table PF_JOB_JOBS
--------------------------------------------------------

  CREATE TABLE "PF_JOB_JOBS" 
   (	"ID" NUMBER, 
	"ID_TIPO_JOB" NUMBER, 
	"FRECUENCIA_NUMERO" NUMBER, 
	"ID_FRECUENCIA_TIPO" NUMBER, 
	"ULTIMA_EJECUCION" TIMESTAMP (6), 
	"ON_OFF" NUMBER DEFAULT 1, 
	"EN_EJECUCION" NUMBER DEFAULT 0, CONSTRAINT PF_JOB_JOBS_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PF_JOB_JOBS_PK1 ON PF_JOB_JOBS (ID ASC) 
  )
  ENABLE
   );
--------------------------------------------------------
--  DDL for Table PF_JOB_PARAMETROS_EJECUCION
--------------------------------------------------------

  CREATE TABLE "PF_JOB_PARAMETROS_EJECUCION" 
   (	"ID" NUMBER, 
	"ID_JOB" NUMBER, 
	"VALOR" BLOB, CONSTRAINT JOB_PARAMETROS_EJECUCION_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX JB_PARAMETROS_EJECUCION_PK1 ON PF_JOB_PARAMETROS_EJECUCION (ID ASC) 
  )
  ENABLE
   );
--------------------------------------------------------
--  DDL for Table PF_JOB_PARAMETROS_GENERALES
--------------------------------------------------------

  CREATE TABLE "PF_JOB_PARAMETROS_GENERALES" 
   (	"ID" NUMBER, 
	"ID_JOB" NUMBER, 
	"PARAMETRO" VARCHAR2(50 BYTE), 
	"VALOR" VARCHAR2(50 BYTE), CONSTRAINT JOB_PARAMETROS_GENERALES_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX JB_PARAMETROS_GENERALES_PK1 ON PF_JOB_PARAMETROS_GENERALES (ID ASC) 
  )
  ENABLE
   );
--------------------------------------------------------
--  DDL for Table PF_JOB_TIPO
--------------------------------------------------------

  CREATE TABLE "PF_JOB_TIPO" 
   (	"ID" NUMBER, 
	"CODIGO" VARCHAR2(50 BYTE), 
	"DESCRIPCION" VARCHAR2(50 BYTE), CONSTRAINT PF_JOB_TIPO_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PF_JOB_TIPO_PK1 ON PF_JOB_TIPO (ID ASC) 
  )
  ENABLE 
   );
--------------------------------------------------------
--  DDL for Table PF_JOB_TIPO_FRECUENCIA
--------------------------------------------------------

  CREATE TABLE "PF_JOB_TIPO_FRECUENCIA" 
   (	"ID" NUMBER, 
	"CODIGO" VARCHAR2(50 BYTE), 
	"DESCRIPCION" VARCHAR2(50 BYTE), CONSTRAINT PF_JOB_TIPO_FRECUENCIA_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PF_JOB_TIPO_FRECUENCIA_PK1 ON PF_JOB_TIPO_FRECUENCIA (ID ASC) 
  )
  ENABLE 
   );

--------------------------------------------------------
--  Constraints for Table PF_JOB_JOBS
--------------------------------------------------------

  ALTER TABLE "PF_JOB_JOBS" MODIFY ("EN_EJECUCION" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_JOBS" MODIFY ("ON_OFF" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_JOBS" MODIFY ("ID_FRECUENCIA_TIPO" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_JOBS" MODIFY ("FRECUENCIA_NUMERO" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_JOBS" MODIFY ("ID_TIPO_JOB" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_JOBS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PF_JOB_PARAMETROS_EJECUCION
--------------------------------------------------------

  ALTER TABLE "PF_JOB_PARAMETROS_EJECUCION" MODIFY ("VALOR" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_PARAMETROS_EJECUCION" MODIFY ("ID_JOB" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_PARAMETROS_EJECUCION" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PF_JOB_PARAMETROS_GENERALES
--------------------------------------------------------

  ALTER TABLE "PF_JOB_PARAMETROS_GENERALES" MODIFY ("VALOR" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_PARAMETROS_GENERALES" MODIFY ("PARAMETRO" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_PARAMETROS_GENERALES" MODIFY ("ID_JOB" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_PARAMETROS_GENERALES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PF_JOB_TIPO
--------------------------------------------------------

  ALTER TABLE "PF_JOB_TIPO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_TIPO" MODIFY ("CODIGO" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_TIPO" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PF_JOB_TIPO_FRECUENCIA
--------------------------------------------------------

  ALTER TABLE "PF_JOB_TIPO_FRECUENCIA" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_TIPO_FRECUENCIA" MODIFY ("CODIGO" NOT NULL ENABLE);
  ALTER TABLE "PF_JOB_TIPO_FRECUENCIA" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PF_JOB_JOBS
--------------------------------------------------------

  ALTER TABLE "PF_JOB_JOBS" ADD CONSTRAINT "PF_JOB_JOBS_FK1" FOREIGN KEY ("ID_TIPO_JOB")
	  REFERENCES "PF_JOB_TIPO" ("ID") ENABLE;
  ALTER TABLE "PF_JOB_JOBS" ADD CONSTRAINT "PF_JOB_JOBS_FK2" FOREIGN KEY ("ID_FRECUENCIA_TIPO")
	  REFERENCES "PF_JOB_TIPO_FRECUENCIA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PF_JOB_PARAMETROS_EJECUCION
--------------------------------------------------------

  ALTER TABLE "PF_JOB_PARAMETROS_EJECUCION" ADD CONSTRAINT "PF_JOB_PARAMETROS_EJECUCI_FK1" FOREIGN KEY ("ID_JOB")
	  REFERENCES "PF_JOB_JOBS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PF_JOB_PARAMETROS_GENERALES
--------------------------------------------------------

  ALTER TABLE "PF_JOB_PARAMETROS_GENERALES" ADD CONSTRAINT "PF_JOB_PARAMETROS_GENERAL_FK1" FOREIGN KEY ("ID_JOB")
	  REFERENCES "PF_JOB_JOBS" ("ID") ENABLE;
    
--------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------
--  DDL for Sequence SQ_JOB_JOBS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_JOB_JOBS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_JOB_PARAMETROS_EJECUCION
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_JOB_PARAMETROS_EJECUCION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_JOB_PARAMETROS_GENERALES
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_JOB_PARAMETROS_GENERALES"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_JOB_TIPO
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_JOB_TIPO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_JOB_TIPO_FRECUENCIA
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_JOB_TIPO_FRECUENCIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

CREATE TABLE qrtz_f_job_details
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    JOB_NAME  VARCHAR2(200) NOT NULL,
    JOB_GROUP VARCHAR2(200) NOT NULL,
    DESCRIPTION VARCHAR2(250) NULL,
    JOB_CLASS_NAME   VARCHAR2(250) NOT NULL, 
    IS_DURABLE VARCHAR2(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR2(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR2(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR2(1) NOT NULL,
    JOB_DATA BLOB NULL,
    CONSTRAINT qrtz_f_JOB_DETAILS_PK PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);
CREATE TABLE qrtz_f_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    JOB_NAME  VARCHAR2(200) NOT NULL, 
    JOB_GROUP VARCHAR2(200) NOT NULL,
    DESCRIPTION VARCHAR2(250) NULL,
    NEXT_FIRE_TIME NUMBER(13) NULL,
    PREV_FIRE_TIME NUMBER(13) NULL,
    PRIORITY NUMBER(13) NULL,
    TRIGGER_STATE VARCHAR2(16) NOT NULL,
    TRIGGER_TYPE VARCHAR2(8) NOT NULL,
    START_TIME NUMBER(13) NOT NULL,
    END_TIME NUMBER(13) NULL,
    CALENDAR_NAME VARCHAR2(200) NULL,
    MISFIRE_INSTR NUMBER(2) NULL,
    JOB_DATA BLOB NULL,
    CONSTRAINT qrtz_f_TRIGGERS_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT qrtz_f_TRIGGER_TO_JOBS_FK FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP) 
      REFERENCES qrtz_f_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP) 
);
CREATE TABLE qrtz_f_simple_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    REPEAT_COUNT NUMBER(7) NOT NULL,
    REPEAT_INTERVAL NUMBER(12) NOT NULL,
    TIMES_TRIGGERED NUMBER(10) NOT NULL,
    CONSTRAINT qrtz_f_SIMPLE_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT qrtz_f_SIMPLE_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
	REFERENCES qrtz_f_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_f_cron_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    CRON_EXPRESSION VARCHAR2(120) NOT NULL,
    TIME_ZONE_ID VARCHAR2(80),
    CONSTRAINT qrtz_f_CRON_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT qrtz_f_CRON_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
      REFERENCES qrtz_f_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_f_simprop_triggers
  (          
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    STR_PROP_1 VARCHAR2(512) NULL,
    STR_PROP_2 VARCHAR2(512) NULL,
    STR_PROP_3 VARCHAR2(512) NULL,
    INT_PROP_1 NUMBER(10) NULL,
    INT_PROP_2 NUMBER(10) NULL,
    LONG_PROP_1 NUMBER(13) NULL,
    LONG_PROP_2 NUMBER(13) NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR2(1) NULL,
    BOOL_PROP_2 VARCHAR2(1) NULL,
    CONSTRAINT qrtz_f_SIMPROP_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT qrtz_f_SIMPROP_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
      REFERENCES qrtz_f_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_f_blob_triggers
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    BLOB_DATA BLOB NULL,
    CONSTRAINT qrtz_f_BLOB_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    CONSTRAINT qrtz_f_BLOB_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
        REFERENCES qrtz_f_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_f_calendars
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    CALENDAR_NAME  VARCHAR2(200) NOT NULL, 
    CALENDAR BLOB NOT NULL,
    CONSTRAINT qrtz_f_CALENDARS_PK PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);
CREATE TABLE qrtz_f_paused_trigger_grps
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR2(200) NOT NULL, 
    CONSTRAINT qrtz_f_PAUSED_TRIG_GRPS_PK PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_f_fired_triggers 
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    ENTRY_ID VARCHAR2(95) NOT NULL,
    TRIGGER_NAME VARCHAR2(200) NOT NULL,
    TRIGGER_GROUP VARCHAR2(200) NOT NULL,
    INSTANCE_NAME VARCHAR2(200) NOT NULL,
    FIRED_TIME NUMBER(13) NOT NULL,
    SCHED_TIME NUMBER(13) NOT NULL,
    PRIORITY NUMBER(13) NOT NULL,
    STATE VARCHAR2(16) NOT NULL,
    JOB_NAME VARCHAR2(200) NULL,
    JOB_GROUP VARCHAR2(200) NULL,
    IS_NONCONCURRENT VARCHAR2(1) NULL,
    REQUESTS_RECOVERY VARCHAR2(1) NULL,
    CONSTRAINT qrtz_f_FIRED_TRIGGER_PK PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);
CREATE TABLE qrtz_f_scheduler_state 
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    INSTANCE_NAME VARCHAR2(200) NOT NULL,
    LAST_CHECKIN_TIME NUMBER(13) NOT NULL,
    CHECKIN_INTERVAL NUMBER(13) NOT NULL,
    CONSTRAINT qrtz_f_SCHEDULER_STATE_PK PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);
CREATE TABLE qrtz_f_locks
  (
    SCHED_NAME VARCHAR2(120) NOT NULL,
    LOCK_NAME  VARCHAR2(40) NOT NULL, 
    CONSTRAINT qrtz_f_LOCKS_PK PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);

create index idx_qrtz_f_j_req_recovery on qrtz_f_job_details(SCHED_NAME,REQUESTS_RECOVERY);
create index idx_qrtz_f_j_grp on qrtz_f_job_details(SCHED_NAME,JOB_GROUP);

create index idx_qrtz_f_t_j on qrtz_f_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_qrtz_f_t_jg on qrtz_f_triggers(SCHED_NAME,JOB_GROUP);
create index idx_qrtz_f_t_c on qrtz_f_triggers(SCHED_NAME,CALENDAR_NAME);
create index idx_qrtz_f_t_g on qrtz_f_triggers(SCHED_NAME,TRIGGER_GROUP);
create index idx_qrtz_f_t_state on qrtz_f_triggers(SCHED_NAME,TRIGGER_STATE);
create index idx_qrtz_f_t_n_state on qrtz_f_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_qrtz_f_t_n_g_state on qrtz_f_triggers(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_qrtz_f_t_next_fire_time on qrtz_f_triggers(SCHED_NAME,NEXT_FIRE_TIME);
create index idx_qrtz_f_t_nft_st on qrtz_f_triggers(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
create index idx_qrtz_f_t_nft_misfire on qrtz_f_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
create index idx_qrtz_f_t_nft_st_misfire on qrtz_f_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
create index idx_qrtz_f_t_nft_st_misfire_gr on qrtz_f_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

create index idx_qrtz_f_ft_trig_inst_name on qrtz_f_fired_triggers(SCHED_NAME,INSTANCE_NAME);
create index idx_qrtz_f_ft_inst_job_req_rcv on qrtz_f_fired_triggers(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
create index idx_qrtz_f_ft_j_g on qrtz_f_fired_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_qrtz_f_ft_jg on qrtz_f_fired_triggers(SCHED_NAME,JOB_GROUP);
create index idx_qrtz_f_ft_t_g on qrtz_f_fired_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
create index idx_qrtz_f_ft_tg on qrtz_f_fired_triggers(SCHED_NAME,TRIGGER_GROUP);
    

ALTER TABLE PF_PROVINCIA ADD (L_LDAP VARCHAR2(1) DEFAULT 'N');
	COMMENT ON COLUMN PF_PROVINCIA.L_LDAP IS 'Indica si se permite configurar ldap en esta sede';
	

CREATE VIEW TIENE_INFORMES_FIRMAS
AS SELECT X_FIRMA, case when B_INFORME is null then 0 else 1 end TIENE_INFORME,
case when B_FIRMA is null then 0 else 1 end TIENE_FIRMA
FROM PF_FIRMAS;

ALTER TABLE PF_PROVINCIA
ADD (L_LARGA_DURACION VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE,	C_URL_CSV VARCHAR2(255 CHAR)); 

CREATE TABLE PF_RESPONSE_ORGANISMOS(
  ID NUMBER NOT NULL,
  FECHA_CONSULTA TIMESTAMP NOT NULL,
  DOCUMENTO_OBTENIDO BLOB
  ,CONSTRAINT PF_RESPONSE_ORGANISMOS_PK PRIMARY KEY ( ID ) ENABLE
);

CREATE TABLE PF_UNIDAD_ORGANIZACIONAL
  (
    CODIGO VARCHAR2(500 CHAR) NOT NULL,
    DENOMINACION VARCHAR2(500 CHAR) NOT NULL,
    ESTADO VARCHAR2(500 CHAR),
    NIVEL_ADMINISTRACION NUMBER,
    NIVEL_JERARQUICO     NUMBER,
    CODUNIDAD_SUPERIOR VARCHAR2(500 CHAR),
    DENOM_UNIDAD_SUPERIOR VARCHAR2(500 CHAR),
    COD_UNIDAD_RAIZ VARCHAR2(500 CHAR),
    DENOM_UNIDAD_RAIZ VARCHAR2(500 CHAR),
    ES_EDP VARCHAR2(500 CHAR),
    COD_TIPO_ENT_PUBLICA VARCHAR2(500 CHAR),
    COD_TIPO_UNIDAD VARCHAR2(500 CHAR),
    COD_AMB_TERRITORIAL   NUMBER,
    COD_AMBENT_GEOGRAFICA NUMBER,
    COD_AMB_PAIS          NUMBER,
    FECHA_ALTA_OFICIAL VARCHAR2(500 CHAR),
    COD_EXTERNO NUMBER,
    ID_PF_RESPONSE_ORGANISMOS NUMBER NOT NULL,
    ID          NUMBER NOT NULL,
    CONSTRAINT PF_UNIDAD_ORGANIZACIONAL_PK PRIMARY KEY ( ID ) ENABLE
  );

ALTER TABLE PF_UNIDAD_ORGANIZACIONAL
ADD CONSTRAINT PF_UNIDAD_ORGANIZACIONAL_UK1 UNIQUE 
(
  CODIGO 
)
ENABLE;

ALTER TABLE PF_UNIDAD_ORGANIZACIONAL
ADD CONSTRAINT PF_UNIDAD_ORGANIZACIONAL_FK1 FOREIGN KEY
(
  ID_PF_RESPONSE_ORGANISMOS 
)
REFERENCES PF_RESPONSE_ORGANISMOS
(
  ID 
)
ENABLE;

CREATE SEQUENCE PF_SQ_UNIDAD_ORGANIZACIONAL INCREMENT BY 1 START WITH 1 MINVALUE 1;

CREATE SEQUENCE PF_SQ_RESPONSE_ORGANISMOS INCREMENT BY 1 START WITH 1 MINVALUE 1;

 ALTER TABLE PF_PROVINCIA 
ADD (ID_ORGANISMO NUMBER );

ALTER TABLE PF_PROVINCIA 
DROP CONSTRAINT PF_PROVINCIA_FK2;

ALTER TABLE PF_PROVINCIA
ADD CONSTRAINT PF_PROVINCIA_FK2 FOREIGN KEY
(
  ID_ORGANISMO 
)
REFERENCES PF_UNIDAD_ORGANIZACIONAL
(
  ID 
)
ENABLE;

CREATE TABLE PF_ADMINISTRADOR_ORGANISMO 
(
  ID_ORGANISMO NUMBER(10,0) NOT NULL 
, ID_USUARIO NUMBER(10,0) NOT NULL 
, CONSTRAINT PF_ADMINISTRADOR_ORGANISMO_PK PRIMARY KEY 
  (
    ID_ORGANISMO 
  , ID_USUARIO 
  )
  ENABLE 
);

ALTER TABLE PF_ADMINISTRADOR_ORGANISMO
ADD CONSTRAINT PF_ADMINISTRADOR_ORGANISM_FK1 FOREIGN KEY
(
  ID_USUARIO 
)
REFERENCES PF_USUARIOS
(
  X_USUARIO 
)
ENABLE;

ALTER TABLE PF_ADMINISTRADOR_ORGANISMO
ADD CONSTRAINT PF_ADMINISTRADOR_ORGANISM_FK2 FOREIGN KEY
(
  ID_ORGANISMO 
)
REFERENCES PF_UNIDAD_ORGANIZACIONAL
(
  ID 
)
ENABLE;


ALTER TABLE PF_ADMINISTRADOR_ORGANISMO  
MODIFY (ID_ORGANISMO NUMBER(10,0) );

ALTER TABLE PF_ADMINISTRADOR_ORGANISMO  
MODIFY (ID_USUARIO NUMBER(10,0) );

alter table PF_FIRMANTES add
   (
   X_TIPO_AUTORIZACION NUMBER(10,0) NULL
   );
   
   COMMENT ON COLUMN PF_FIRMANTES.X_TIPO_AUTORIZACION IS 'Foreign key a la tabla PF_TIPOS_AUTORIZACION';

alter table PF_FIRMANTES add constraint fk_firmante_tipo_autorizacion FOREIGN KEY (X_TIPO_AUTORIZACION) references PF_TIPOS_AUTORIZACION (X_TIPO_AUTORIZACION) initially deferred deferrable;   

ALTER TABLE PF_PETICIONES ADD L_MARCA_FIRMA VARCHAR2(1) DEFAULT 'N' NULL;
COMMENT ON COLUMN PF_PETICIONES.L_MARCA_FIRMA IS 'Indica si el documento firmado de la petición debe llevar la marca de Firmado';

CREATE TABLE PF_USUARIOS_GESTORES
(
	USU_X_USUARIO        	 	NUMBER(10) NOT NULL,    --  Clave ajena a PF_USUARIOS
	USU_X_USUARIO_GESTOR     NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS 
);
COMMENT ON TABLE PF_USUARIOS_GESTORES IS 'Usuarios gestores'
;
COMMENT ON COLUMN PF_USUARIOS_GESTORES.USU_X_USUARIO         IS 'Clave ajena a PF_USUARIOS, el usuario que va a ser gestionado'
;
COMMENT ON COLUMN PF_USUARIOS_GESTORES.USU_X_USUARIO_GESTOR    IS 'Clave ajena a PF_USUARIOS, el usuario que va a gestionar'
;

ALTER TABLE PF_USUARIOS_GESTORES ADD CONSTRAINT PF_USUGEST_PK 
	PRIMARY KEY (USU_X_USUARIO,USU_X_USUARIO_GESTOR);
	
ALTER TABLE PF_USUARIOS_GESTORES ADD CONSTRAINT PF_UGESTOR_USU_FK 
	FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS (X_USUARIO)
;

ALTER TABLE PF_USUARIOS_GESTORES ADD CONSTRAINT PF_UGESTOR_GEST_USU_FK 
	FOREIGN KEY (USU_X_USUARIO_GESTOR) REFERENCES PF_USUARIOS (X_USUARIO)
;	

CREATE TABLE PF_VALIDADOR_APLICACION 
(
  X_VALIDADOR_APLICACION NUMBER(10, 0) NOT NULL 
, USU_X_USUARIO NUMBER(10, 0) NOT NULL 
, USU_X_USUARIO_VALIDADOR NUMBER(10, 0) NOT NULL 
, APL_X_APLICACION NUMBER(10, 0) NOT NULL 
, C_CREADO VARCHAR2(20 BYTE) DEFAULT USER 
, F_CREADO DATE DEFAULT SYSDATE 
, C_MODIFICADO VARCHAR2(20 BYTE) DEFAULT USER 
, F_MODIFICADO DATE DEFAULT SYSDATE 
, CONSTRAINT PF_VALIDADOR_APLICACION_PK PRIMARY KEY 
  (
    X_VALIDADOR_APLICACION
  )
  ENABLE 
);

ALTER TABLE PF_VALIDADOR_APLICACION
ADD CONSTRAINT PF_VALIDADOR_APLICACION_FK1 FOREIGN KEY
(
  USU_X_USUARIO 
)
REFERENCES PF_USUARIOS
(
  X_USUARIO 
)
ENABLE;

ALTER TABLE PF_VALIDADOR_APLICACION
ADD CONSTRAINT PF_VALIDADOR_APLICACION_FK2 FOREIGN KEY
(
  USU_X_USUARIO_VALIDADOR 
)
REFERENCES PF_USUARIOS
(
  X_USUARIO 
)
ENABLE;

ALTER TABLE PF_VALIDADOR_APLICACION
ADD CONSTRAINT PF_VALIDADOR_APLICACION_FK3 FOREIGN KEY
(
  APL_X_APLICACION 
)
REFERENCES PF_APLICACIONES
(
  X_APLICACION 
)
ENABLE;

COMMENT ON COLUMN PF_VALIDADOR_APLICACION.USU_X_USUARIO IS 'Clave ajena a PF_USUARIOS, el usuario que va a ser validado.';

COMMENT ON COLUMN PF_VALIDADOR_APLICACION.USU_X_USUARIO_VALIDADOR IS 'Clave ajena a PF_USUARIOS, el usuario que va a ser validador.';

COMMENT ON COLUMN PF_VALIDADOR_APLICACION.APL_X_APLICACION IS 'Clave ajena a PF_APLICACIONES, la aplicacion que se va a validar.';

CREATE SEQUENCE PF_S_VAAP INCREMENT BY 1 MAXVALUE 999999999999999999999999999 MINVALUE 1 NOCACHE;


CREATE TABLE PF_ACCION_FIRMANTE
(
	X_ACCION_FIRMANTE  NUMBER(10) NOT NULL,    -- Clave primaria de PF_ACCION_FIRMANTE
	C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_CREADO             DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,    --  Campo de auditoria 
	F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,    --  Campo de auditoria 
	C_ACCION_FIRMANTE  VARCHAR2(30) NOT NULL,    -- Codigo de la accion del firmante
	D_ACCION_FIRMANTE  VARCHAR2(255) NOT NULL,    -- Descripción de la accion del fimante
	L_VIGENTE       VARCHAR2(1) DEFAULT 'S' NOT NULL    -- Vigencia de la accion
)
;

ALTER TABLE PF_ACCION_FIRMANTE ADD CONSTRAINT PF_ACCION_FIRMANTE_PK 
	PRIMARY KEY (X_ACCION_FIRMANTE);

COMMENT ON TABLE PF_ACCION_FIRMANTE IS 'Acciones que toma el firmante en la línea de firma PF_ACCION_FIRMANTE'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.X_ACCION_FIRMANTE  IS 'Clave primaria de PF_ACCION_FIRMANTE'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.C_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.F_CREADO        IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.C_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.F_MODIFICADO    IS 'Campo de auditoria'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.C_ACCION_FIRMANTE  IS 'Codigo de la accion del firmante'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.D_ACCION_FIRMANTE  IS 'Descripción de la accion del fimante'
;
COMMENT ON COLUMN PF_ACCION_FIRMANTE.L_VIGENTE       IS 'Vigencia de la accion'
;

--Insertamos aqui los valores porque si no falla el alter que viene a continuación
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (1, '1', 'Sin acción específica');
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (2, '2', 'Aprueba');
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (3, '3', 'Informa');
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (4, '4', 'Recibe');
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (5, '5', 'Certifica');
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (6, '6', 'Propone');
INSERT INTO PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE, C_ACCION_FIRMANTE, D_ACCION_FIRMANTE)
VALUES (7, '7', 'Resuelve');
commit;

alter table PF_LINEAS_FIRMA add
   (
   X_ACCION_FIRMANTE NUMBER(10) default '1' NULL
   );
   
   COMMENT ON COLUMN PF_LINEAS_FIRMA.X_ACCION_FIRMANTE IS 'Foreign key a la tabla PF_ACCION_FIRMANTE';

alter table PF_LINEAS_FIRMA add constraint fk_accion_firmante FOREIGN KEY (X_ACCION_FIRMANTE) references PF_ACCION_FIRMANTE (X_ACCION_FIRMANTE) initially deferred deferrable;   
 
 
 alter table PF_PLANTILLA_PETICION add
   (
   C_ACCIONES_FIRMA VARCHAR2(255) NULL
   );
   
   COMMENT ON COLUMN PF_PLANTILLA_PETICION.C_ACCIONES_FIRMA IS 'Indica las acciones seleccionada para cada firmante';
   
    ALTER TABLE PF_PETICIONES ADD (USUARIO_BLOQUEO NUMBER(10));

   ALTER TABLE PF_PLANTILLA_PETICION MODIFY (C_FIRMA_VISTOBUENO VARCHAR2(4000 CHAR));

ALTER TABLE PF_PLANTILLA_PETICION MODIFY (D_DESTINATARIOS VARCHAR2(4000 CHAR));

ALTER TABLE PF_PLANTILLA_PETICION MODIFY (C_ACCIONES_FIRMA VARCHAR2(2000 CHAR));

ALTER TABLE PF_UNIDAD_ORGANIZACIONAL
DROP CONSTRAINT PF_UNIDAD_ORGANIZACIONAL_FK1;

ALTER TABLE PF_UNIDAD_ORGANIZACIONAL
DROP COLUMN ID_PF_RESPONSE_ORGANISMOS;

TRUNCATE TABLE PF_RESPONSE_ORGANISMOS;

ALTER TABLE PF_RESPONSE_ORGANISMOS ADD CODIGO_RESPUESTA VARCHAR2(3 CHAR);
ALTER TABLE PF_RESPONSE_ORGANISMOS ADD DESCRIPCION_RESPUESTA VARCHAR2(300 CHAR);


CREATE TABLE PF_ORGANISMO_DIR3
  ( ID          NUMBER NOT NULL,
    CODIGO VARCHAR2(50 CHAR) NOT NULL,
	VERSION NUMBER,
    DENOMINACION VARCHAR2(300 CHAR) NOT NULL,
	DNM_LENGUA_COOFICIAL VARCHAR2(300 CHAR),
	IDIOMA_LENGUA VARCHAR2(300 CHAR),
    ESTADO VARCHAR2(2 CHAR),
    NIF_CIF VARCHAR2(9 CHAR),
	SIGLAS VARCHAR2(10 CHAR),
	NIVEL_ADMINISTRACION NUMBER,
    NIVEL_JERARQUICO     NUMBER,
    COD_UNIDAD_SUPERIOR VARCHAR2(50 CHAR),
	V_UNIDAD_SUPERIOR NUMBER,
    DENOM_UNIDAD_SUPERIOR VARCHAR2(300 CHAR),
    COD_UNIDAD_RAIZ VARCHAR2(50 CHAR),
	V_UNIDAD_RAIZ NUMBER,
    DENOM_UNIDAD_RAIZ VARCHAR2(300 CHAR),
    ES_EDP VARCHAR2(1 CHAR),
	COD_EDP_PRINCIPAL VARCHAR2(50 CHAR),
	V_EDP_PRINCIPAL NUMBER,
	DENOM_EDP_PRINCIPAL VARCHAR2(300 CHAR),
	COD_PODER NUMBER,
    COD_TIPO_ENT_PUBLICA VARCHAR2(2 CHAR),
    COD_TIPO_UNIDAD VARCHAR2(3 CHAR),
    COD_AMB_TERRITORIAL   VARCHAR2(2 CHAR),
    COD_AMBENT_GEOGRAFICA VARCHAR2(2 CHAR),
    COD_AMB_PAIS          VARCHAR2(3 CHAR),
	COD_AMB_COMUNIDAD VARCHAR2(2 CHAR),
	COD_AMB_PROVINCIA VARCHAR2(2 CHAR),
	COD_AMB_MUNICIPIO VARCHAR2(4 CHAR),
	COD_AMB_ISLA VARCHAR2(2 CHAR),
	COD_AMB_ELM VARCHAR2(4 CHAR),
	COD_AMB_LOC_EXTRANJERA VARCHAR2(500 CHAR),
	COMPETENCIAS VARCHAR2(300 CHAR),
	DISPOSICION_LEGAL VARCHAR2(300 CHAR),
    FECHA_ALTA_OFICIAL VARCHAR2(100 CHAR),
	FECHA_BAJA_OFICIAL VARCHAR2(100 CHAR),
	FECHA_EXTINCION VARCHAR2(100 CHAR),
	FECHA_ANULACION  VARCHAR2(100 CHAR),
	FECHA_ULTIMA_ACTUALIZACION  VARCHAR2(100 CHAR),
    COD_EXTERNO VARCHAR2(300 CHAR),
	OBSERV_GENERALES VARCHAR2(400 CHAR),
	OBSERV_BAJA VARCHAR2(400 CHAR),
	DIRECC_TIPO_VIA VARCHAR2(2 CHAR),
	DIRECC_NOMBRE_VIA VARCHAR2(300 CHAR),
	DIRECC_NUM_VIA VARCHAR2(100 CHAR),
	DIRECC_COD_POSTAL VARCHAR2(10 CHAR),
	DIRECC_COD_PAIS VARCHAR2(3 CHAR),
	DIRECC_COD_COMUNIDAD VARCHAR2(2 CHAR),
	DIRECC_COD_PROVINCIA VARCHAR2(2 CHAR),
	DIRECC_COD_LOCALIDAD VARCHAR2(4 CHAR),
	DIRECC_COD_ENT_GEOGRAFICA VARCHAR2(2 CHAR),
	DIRECC_DIR_EXTRANJERA VARCHAR2(500 CHAR),
	DIRECC_LOC_EXTRANJERA VARCHAR2(500 CHAR),
	DIRECC_OBSERVACIONES VARCHAR2(500 CHAR),
	COMPARTE_NIF VARCHAR2(1 CHAR),
    ID_PF_RESPONSE_ORGANISMOS NUMBER NOT NULL,
    CONSTRAINT PF_ORGANISMO_DIR3_PK PRIMARY KEY ( ID ) ENABLE
  );

ALTER TABLE PF_ORGANISMO_DIR3
ADD CONSTRAINT PF_ORGANISMO_DIR3_UK1 UNIQUE 
(
  CODIGO 
)
ENABLE;

ALTER TABLE PF_ORGANISMO_DIR3
ADD CONSTRAINT PF_ORGANISMO_DIR3_FK1 FOREIGN KEY
(
  ID_PF_RESPONSE_ORGANISMOS 
)
REFERENCES PF_RESPONSE_ORGANISMOS
(
  ID 
)
ENABLE;

CREATE SEQUENCE PF_SQ_ORGANISMO_DIR3 INCREMENT BY 1 START WITH 1 MINVALUE 1;

ALTER TABLE PF_USUARIOS ADD (L_MOSTRAR_FIRMANTE_ANTERIOR VARCHAR2(1 CHAR) DEFAULT 'N');

COMMENT ON COLUMN PF_USUARIOS.L_MOSTRAR_FIRMANTE_ANTERIOR IS 'Indica si será visible el ultimo firmante en firmas en cascada en peticiones pendientes';

ALTER TABLE PF_PETICIONES ADD (IMPORTE_FACTURA_CONTRATO NUMBER(18));

ALTER TABLE PF_FIRMAS ADD (CSV_INF_NORMALIZADO VARCHAR2(32));

COMMENT ON COLUMN PF_FIRMAS.CSV_INF_NORMALIZADO IS 'Código seguro de verificación de la firma del informe normalizado'
;
ALTER TABLE PF_FIRMAS ADD (REF_NAS_IDENI VARCHAR2(255));

COMMENT ON COLUMN PF_FIRMAS.REF_NAS_IDENI IS 'Referencia NAS/IDENI con el que fue guardada la firma'
;

ALTER TABLE PF_FIRMAS ADD (REF_NAS_DIR3_FIRMA VARCHAR2(255));

COMMENT ON COLUMN PF_FIRMAS.REF_NAS_DIR3_FIRMA IS 'Referencia NAS/dir3 con el que fue creada la firma'
;

ALTER TABLE PF_FIRMAS ADD (REF_NAS_DIR3_INFORME VARCHAR2(255));

COMMENT ON COLUMN PF_FIRMAS.REF_NAS_DIR3_INFORME IS 'Referencia NAS/dir3 con el que fue creado el informe'
;

ALTER TABLE PF_FIRMAS ADD (REF_NAS_DIR3_INF_NORMALIZADO VARCHAR2(255));

COMMENT ON COLUMN PF_FIRMAS.REF_NAS_DIR3_INF_NORMALIZADO IS 'Referencia NAS/dir3 con el que fue creado el informe normalizado'
;

ALTER TABLE PF_FIRMAS ADD (C_TIPO_INFORME VARCHAR2(10));

COMMENT ON COLUMN PF_FIRMAS.C_TIPO_INFORME IS 'Tipo de almacenamiento del informe'
;

ALTER TABLE PF_FIRMAS ADD (C_TIPO_INF_NORMALIZADO VARCHAR2(10));

COMMENT ON COLUMN PF_FIRMAS.C_TIPO_INF_NORMALIZADO IS 'Tipo de almacenamiento del informe normalizado'
;

ALTER TABLE PF_ARCHIVOS ADD (REF_NAS_DIR3 VARCHAR2(255));

COMMENT ON COLUMN PF_ARCHIVOS.REF_NAS_DIR3 IS 'Referencia NAS/dir3 con el que fue guardado el archivo'
;
ALTER TABLE PF_ARCHIVOS ADD (REF_NAS_IDENI VARCHAR2(255));

COMMENT ON COLUMN PF_ARCHIVOS.REF_NAS_IDENI IS 'Referencia NAS/IDENI con el que fue guardado el archivo'
;

CREATE TABLE PF_USUARIOS_RESTRINGIDOS
(
 USU_X_USUARIO_RESTRINGIDO NUMBER(10) NOT NULL,   --  Clave ajena a PF_USUARIOS
 USU_X_USUARIO_VALIDO      NUMBER(10) NOT NULL    --  Clave ajena a PF_USUARIOS
);

COMMENT ON TABLE PF_USUARIOS_RESTRINGIDOS IS 'Usuarios restringidos';
COMMENT ON COLUMN PF_USUARIOS_RESTRINGIDOS.USU_X_USUARIO_RESTRINGIDO IS 'Clave ajena a PF_USUARIOS, el usuario que va a ser restringido';
COMMENT ON COLUMN PF_USUARIOS_RESTRINGIDOS.USU_X_USUARIO_VALIDO IS 'Clave ajena a PF_USUARIOS, el usuario al que va a poder enviar peticiones el restringido';

ALTER TABLE PF_USUARIOS_RESTRINGIDOS ADD CONSTRAINT PF_USUREST_PK 
	PRIMARY KEY (USU_X_USUARIO_RESTRINGIDO,USU_X_USUARIO_VALIDO);
  
ALTER TABLE PF_USUARIOS_RESTRINGIDOS ADD CONSTRAINT PF_URESTRINGIDO_USU_FK 
	FOREIGN KEY (USU_X_USUARIO_RESTRINGIDO) REFERENCES PF_USUARIOS (X_USUARIO);

ALTER TABLE PF_USUARIOS_RESTRINGIDOS ADD CONSTRAINT PF_URESTRINGIDO_REST_USU_FK 
	FOREIGN KEY (USU_X_USUARIO_VALIDO) REFERENCES PF_USUARIOS (X_USUARIO);
	
CREATE TABLE
    PF_PORTAFIRMAS
    (
        ID_PORTAFIRMAS       NUMBER(10) NOT NULL,
        NOMBRE               VARCHAR2(100 CHAR) NOT NULL,
        DIR3                 VARCHAR2(50 CHAR) NOT NULL,
        URL_INTERFAZ         VARCHAR2(200 CHAR) NOT NULL,
        URL_NOTIFICACION     VARCHAR2(200 CHAR) NOT NULL,
        C_PORTAFIRMAS        VARCHAR2(50 CHAR) NOT NULL,

        C_CREADO             VARCHAR2(20) DEFAULT USER NOT NULL,
        F_CREADO             DATE DEFAULT SYSDATE NOT NULL,
        C_MODIFICADO         VARCHAR2(20) DEFAULT USER NOT NULL,
        F_MODIFICADO         DATE DEFAULT SYSDATE NOT NULL,

        CONSTRAINT IG_PF_PK PRIMARY KEY (ID_PORTAFIRMAS)

    );
COMMENT ON TABLE PF_PORTAFIRMAS IS 'Listado de portafirmas';
COMMENT ON COLUMN PF_PORTAFIRMAS.ID_PORTAFIRMAS IS 'Clave primaria';
COMMENT ON COLUMN PF_PORTAFIRMAS.NOMBRE IS 'Nombre del portafirmas';
COMMENT ON COLUMN PF_PORTAFIRMAS.DIR3 IS 'dir3 del portafirmas';
COMMENT ON COLUMN PF_PORTAFIRMAS.URL_INTERFAZ IS 'Url de los servicios web de interfaz genérica del portafirmas';
COMMENT ON COLUMN PF_PORTAFIRMAS.URL_NOTIFICACION IS 'Url del servicio web para notificar cambios de estado en la petición de firma';
COMMENT ON COLUMN PF_PORTAFIRMAS.C_PORTAFIRMAS IS 'Codigo externo del Portafirmas externo';
COMMENT ON COLUMN PF_PORTAFIRMAS.C_CREADO IS 'Auditoria quien crea';
COMMENT ON COLUMN PF_PORTAFIRMAS.F_CREADO IS 'Auditoria cuando se crea';
COMMENT ON COLUMN PF_PORTAFIRMAS.C_MODIFICADO IS 'Auditoria quien modifica';
COMMENT ON COLUMN PF_PORTAFIRMAS.F_MODIFICADO IS 'Auditoria cuando se modifica';

ALTER TABLE PF_USUARIOS ADD ID_PORTAFIRMAS       NUMBER(10);
COMMENT ON COLUMN PF_USUARIOS.ID_PORTAFIRMAS IS 'Indica el portafirmas al que pertenece un usuario, que entonces se considera EXTERNO';
ALTER TABLE PF_USUARIOS ADD CONSTRAINT PF_USU_POR_FK FOREIGN KEY (ID_PORTAFIRMAS) REFERENCES PF_PORTAFIRMAS (ID_PORTAFIRMAS);

-- La secuencia empieza por un valor utilizado y a partir del cual, no está ninguno en uso.
CREATE SEQUENCE PF_PORTAFIRMAS_SEQ
INCREMENT BY 1
START WITH 2
NOMAXVALUE
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER;






-- Se elimina la relación a PF_DOCELWEB_SOLICITUD_SGESTION de Portafirmas OBSOLETA
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION DROP CONSTRAINT PF_DOCELWEB_SOL_PFIRMA_FK;
	
-- Se elimina la relación a PF_DOCELWEB_SOLICITUD_SPFIRMA de Portafirmas OBSOLETA
ALTER TABLE PF_DOCELWEB_SOLICITUD_SPFIRMA DROP CONSTRAINT PF_DOCELWEB_SOL_GES_FK;

-- Se elimina restricción obsoleta
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION DROP CONSTRAINT PF_DOCELWEB_SOL_SGEST_UNIQUE;

-- Se crea las relaciones que sustituyen a las dos anteriores: Tabla única para guardar Portafirmas externos
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD CONSTRAINT PF_DOCELWEB_SOL_SM_PF_FK
	FOREIGN KEY (SOLICITUD_X_PFIRMA) REFERENCES PF_PORTAFIRMAS (ID_PORTAFIRMAS);
	
ALTER TABLE PF_DOCELWEB_SOLICITUD_SPFIRMA ADD CONSTRAINT PF_DOCELWEB_SOL_SPF_PF_FK
	FOREIGN KEY (SOLICITUD_X_GESTOR) REFERENCES PF_PORTAFIRMAS (ID_PORTAFIRMAS);

-- Se eliminan las tablas 1 y 2 de Portafirmas OBSOLETAS
DROP TABLE PF_DOCELWEB_GESTOR;
DROP TABLE PF_DOCELWEB_PFIRMA;

-- Se crea relación con las peticiones a través de la tabla etiquetas-peticion
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD X_ETIQUETA_PETICION NUMBER(22) NOT NULL;
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.X_ETIQUETA_PETICION IS 'Relación con peticiones vía etiquetas petición';
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD CONSTRAINT PF_SOL_SM_PET_FK FOREIGN KEY (X_ETIQUETA_PETICION) REFERENCES PF_ETIQUETAS_PETICION (X_ETIQUETA_PETICION);

-- Se crea relación con documentos
ALTER TABLE PF_DOCELWEB_SM_DOC ADD DOC_X_DOCUMENTO NUMBER(22);
COMMENT ON COLUMN PF_DOCELWEB_SM_DOC.DOC_X_DOCUMENTO IS 'Relación con documentos';
ALTER TABLE PF_DOCELWEB_SM_DOC ADD CONSTRAINT PF_DOC_SM_DOC_FK FOREIGN KEY (DOC_X_DOCUMENTO) REFERENCES PF_DOCUMENTOS (X_DOCUMENTO);

-- Se añade texto de rechazo recepcionado
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION ADD TEXTO_RECHAZO VARCHAR(200);
COMMENT ON COLUMN PF_DOCELWEB_SOLICITUD_SGESTION.TEXTO_RECHAZO IS 'Texto opcional del motivo del rechazo.';

-- Se cambia el nombre de la columna id_transaccion
ALTER TABLE PF_DOCELWEB_SOLICITUD_SGESTION RENAME COLUMN D_ID_TRANSACTION TO ID_TRANSACCION;

-- Se crea la tabla para control de bloqueos en las Spring-Tasks
CREATE TABLE SHEDLOCK(
  NAME VARCHAR(64),
  LOCK_UNTIL TIMESTAMP(3) NULL,
  LOCKED_AT TIMESTAMP(3) NULL,
  LOCKED_BY  VARCHAR(255),
  PRIMARY KEY (NAME)
);

ALTER TABLE PF_ETIQUETAS_PETICION ADD (USU_X_VALIDADOR NUMBER);

ALTER TABLE PF_PORTAFIRMAS ADD SOAP_VERSION NUMBER(1) DEFAULT 1;
COMMENT ON COLUMN PF_PORTAFIRMAS.SOAP_VERSION IS 'Version SOAP que implementa el cliente para consumir la Interfaz Generica';

CREATE TABLE PF_AUDITORIA (
	X_AUDITORIA NUMBER NOT NULL,
	C_CREADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL,
	F_CREADO DATE DEFAULT SYSDATE NOT NULL,
	C_MODIFICADO VARCHAR2(20) DEFAULT 'USER ' NOT NULL,
	F_MODIFICADO DATE DEFAULT SYSDATE NOT NULL,
	USU_X_USUARIO NUMBER NOT NULL,
	USU_X_USU_SIMULADO NUMBER NOT NULL,
	D_OPERACION VARCHAR2(256) NOT NULL,
	D_CLASE VARCHAR2(256) NOT NULL,
	D_METODO VARCHAR2(256) NOT NULL,
	D_PARAMETROS VARCHAR2(512) NULL,
	CONSTRAINT PF_AUDT_PK PRIMARY KEY (X_AUDITORIA),
	CONSTRAINT PF_AUDITORIA_PF_USUARIOS_FK FOREIGN KEY (USU_X_USUARIO) REFERENCES PF_USUARIOS(X_USUARIO),
	CONSTRAINT PF_AUDITORIA_PF_USUARIOS_FK_1 FOREIGN KEY (USU_X_USU_SIMULADO) REFERENCES PF_USUARIOS(X_USUARIO)
)
TABLESPACE SYSTEM;
COMMENT ON TABLE PF_AUDITORIA IS 'Tabla de auditoria para incluir informacion de usuarios simulados';


CREATE SEQUENCE PF_SQ_AUDITORIA
MINVALUE 1 MAXVALUE 9999999999999999999999999999
INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE;	

CREATE INDEX PF_I_FIR_CSVNORM ON PF_FIRMAS
(CSV_INF_NORMALIZADO ASC)
TABLESPACE  TS_PFIRMA_INDICES;

