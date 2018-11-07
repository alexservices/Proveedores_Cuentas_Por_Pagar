/*Proyecto Final Base de Datos I*/
/*Creación de Roles*/
CREATE ROLE Administrator;
CREATE ROLE Reader;
/*Asignar Permismos a Roles*/
GRANT CREATE USER, CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE,CREATE SYNONYM,
ALTER TABLE,ALTER VIEW, ALTER PROCEDURE,ALTER SYNONYM,
DROP TABLE, DROP VIEW, DROP PROCEDURE,DROP SYNONYM,INSERT, UPDATE, DELETE  TO Administrator;
GRANT SELECT TO Reader;
/*Creacion de Usuarios*/
CREATE USER INVITADO IDENTIFIED BY umgDB2018**;
CREATE USER INGENIEROL3 IDENTIFIED BY 1NG3N13R0DB2018**;
/*Asignar Roles A Usuarios */
GRANT Administrator TO INGENIEROL3
GRANT INVITADO TO Reader;


/* Crear tablas, constraints, index, foreign */
CREATE TABLE departamento (
    id_dep       INTEGER NOT NULL,
    nombre_dep   VARCHAR2(25) NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_dep );

CREATE SEQUENCE ID_DEP
MINVALUE 1
NOMAXVALUE
START WITH 1
NOCYCLE
CACHE  20
NOORDER;

CREATE TABLE proveedor (
    nit_pro               INTEGER NOT NULL,
    nombre_pro            VARCHAR2(30) NOT NULL,
    telefono_pro          NUMBER(8) NOT NULL,
    correo_pro            VARCHAR2(40) NOT NULL,
    direccion_pro         VARCHAR2(40) NOT NULL,
    departamento_id_dep   INTEGER NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT pro_pk PRIMARY KEY ( nit_pro );

CREATE SEQUENCE ID_PRO
MINVALUE 1
NOMAXVALUE
START WITH 1
NOCYCLE
CACHE  20
NOORDER;

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_departamento_fk FOREIGN KEY ( departamento_id_dep )
        REFERENCES departamento ( id_dep )
            ON DELETE CASCADE;
                       
select nit_pro, nombre_pro,telefono_pro,correo_pro,direccion_pro, nombre_dep
from proveedor
join departamento on proveedor.departamento_id_dep = departamento.id_dep;




CREATE TABLE sede (
    sede_id       NUMBER NOT NULL,
    nombre_sede   VARCHAR2(50) NOT NULL
);

ALTER TABLE sede ADD CONSTRAINT sede_pk PRIMARY KEY ( sede_id );

CREATE SEQUENCE ID_DEP
MINVALUE 1

NOMAXVALUE
START WITH 1
NOCYCLE
CACHE  20
NOORDER;
