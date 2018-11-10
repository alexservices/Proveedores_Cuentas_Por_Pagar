/*Proyecto Final Base de Datos I*/
/*CreaciÃ³n de Roles*/
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
/*-----------------*/

/* Creacion de Tablas*/
CREATE TABLE a_pagar (
    correlativo_apa    INTEGER NOT NULL,
    orden_factura_or   INTEGER NOT NULL,
    estado_p_id_epa    INTEGER NOT NULL,
    total_a_pagar      NUMBER
);

CREATE TABLE cuenta_cliente (
    id_cuenta           INTEGER NOT NULL,
    nombre_cuenta       VARCHAR2(30) NOT NULL,
    saldo               NUMBER,
    proveedor_nit_pro   INTEGER NOT NULL,
    sede_id_se          INTEGER NOT NULL
);


CREATE TABLE departamento (
    id_dep       INTEGER NOT NULL,
    nombre_dep   VARCHAR2(25) NOT NULL
);

CREATE TABLE estado_p (
    id_epa            INTEGER NOT NULL,
    descripcion_epa   VARCHAR2(20) NOT NULL
);

CREATE TABLE metodo_pago (
    id_metodo       INTEGER NOT NULL,
    descripcion_m   VARCHAR2(15) NOT NULL
);

CREATE TABLE orden (
    factura_or                 INTEGER NOT NULL,
    fecha_emision              DATE NOT NULL,
    fecha_lim_pago             DATE NOT NULL,
    cuenta_cliente_id_cuenta   INTEGER NOT NULL,
    total                      NUMBER
);

CREATE TABLE pagos (
    correlativo_pa            INTEGER NOT NULL,
    fecha_pa                  DATE NOT NULL,
    abono_pa                  NUMBER,
    metodo_pago_id_metodo     INTEGER NOT NULL,
    a_pagar_correlativo_apa   INTEGER NOT NULL
);

CREATE TABLE proveedor (
    nit_pro               INTEGER NOT NULL,
    nombre_pro            VARCHAR2(30) NOT NULL,
    telefono_pro          NUMBER(8) NOT NULL,
    correo_pro            VARCHAR2(40) NOT NULL,
    direccion_pro         VARCHAR2(40) NOT NULL,
    departamento_id_dep   INTEGER NOT NULL
);

CREATE TABLE sede (
    id_se                 INTEGER NOT NULL,
    nombre_se             VARCHAR2(30) NOT NULL,
    telefono_se           NUMBER(8) NOT NULL,
    correo_se             VARCHAR2(30) NOT NULL,
    direccion_se          VARCHAR2(40) NOT NULL,
    departamento_id_dep   INTEGER NOT NULL
);

*/------------------------------------/*

/* aqui empiezan los PRIMARY KEY */

ALTER TABLE a_pagar ADD CONSTRAINT a_pagar_pk PRIMARY KEY ( correlativo_apa );

ALTER TABLE cuenta_cliente ADD CONSTRAINT cuenta_cliente_pk PRIMARY KEY ( id_cuenta );

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_dep );

ALTER TABLE estado_p ADD CONSTRAINT estado_p_pk PRIMARY KEY ( id_epa );

ALTER TABLE metodo_pago ADD CONSTRAINT metodo_pago_pk PRIMARY KEY ( id_metodo );

ALTER TABLE orden ADD CONSTRAINT orden_pk PRIMARY KEY ( factura_or );

ALTER TABLE pagos ADD CONSTRAINT pagos_pk PRIMARY KEY ( correlativo_pa );

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( nit_pro );

ALTER TABLE sede ADD CONSTRAINT sede_pk PRIMARY KEY ( id_se );

/* los FOREIGN KEY */

ALTER TABLE a_pagar
    ADD CONSTRAINT a_pagar_estado_p_fk FOREIGN KEY ( estado_p_id_epa )
        REFERENCES estado_p ( id_epa )
            ON DELETE CASCADE;

ALTER TABLE a_pagar
    ADD CONSTRAINT a_pagar_orden_fk FOREIGN KEY ( orden_factura_or )
        REFERENCES orden ( factura_or );

ALTER TABLE cuenta_cliente
    ADD CONSTRAINT cuenta_cliente_proveedor_fk FOREIGN KEY ( proveedor_nit_pro )
        REFERENCES proveedor ( nit_pro )
            ON DELETE CASCADE;

ALTER TABLE cuenta_cliente
    ADD CONSTRAINT cuenta_cliente_sede_fk FOREIGN KEY ( sede_id_se )
        REFERENCES sede ( id_se )
            ON DELETE CASCADE;

ALTER TABLE orden
    ADD CONSTRAINT orden_cuenta_cliente_fk FOREIGN KEY ( cuenta_cliente_id_cuenta )
        REFERENCES cuenta_cliente ( id_cuenta )
            ON DELETE CASCADE;

ALTER TABLE pagos
    ADD CONSTRAINT pagos_a_pagar_fk FOREIGN KEY ( a_pagar_correlativo_apa )
        REFERENCES a_pagar ( correlativo_apa )
            ON DELETE CASCADE;

ALTER TABLE pagos
    ADD CONSTRAINT pagos_metodo_pago_fk FOREIGN KEY ( metodo_pago_id_metodo )
        REFERENCES metodo_pago ( id_metodo );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_departamento_fk FOREIGN KEY ( departamento_id_dep )
        REFERENCES departamento ( id_dep )
            ON DELETE CASCADE;

ALTER TABLE sede
    ADD CONSTRAINT sede_departamento_fk FOREIGN KEY ( departamento_id_dep )
        REFERENCES departamento ( id_dep )
            ON DELETE CASCADE;

/* CREACION DE SECUENCIAS */

 CREATE SEQUENCE   "ID_APA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 ORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_CUENTA"  MINVALUE 888 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 968 CACHE 20 ORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_DEP"  MINVALUE 1 MAXVALUE 30 INCREMENT BY 1 START WITH 21 NOCACHE  ORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_EPA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_M"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_ORDEN"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 ORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_PA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 ORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_PRO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOPARTITION
/

CREATE SEQUENCE   "ID_SE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOPARTITION
/

/*Procesamiento para setear datos en la tabla A_Pagar*/

insert into a_pagar (correlativo_apa,orden_factura_or,estado_p_id_epa,total_a_pagar)  
values (id_apa.nextval,:P47_FACTURA_OR,2,:P47_TOTAL)


/*Procesamiento para actualizar en la tabla cuenta_cliente 
el saldo de una cuenta cuando se cree una factura de una orden*/

update cuenta_cliente set saldo= :P47_TOTAL+cuenta_cliente.saldo where id_cuenta = :P47_CUENTA_CLIENTE_ID_CUENTA

/*List View en apex */
select orden_factura_or as d,
       correlativo_apa as r
  from a_pagar
 order by 1
 
/*---*/ 
 select nombre_cuenta as d,
       id_cuenta as r
  from cuenta_cliente
 order by 1

/*--*/

select nombre_dep as d,
       id_dep as r
  from departamento
 order by 1
 
 /*--*/select nombre_se as d,
       id_se as r
  from sede 
 order by 1;
 
 select descripcion_m as d,
       id_metodo as r
  from metodo_pago
 order by 1
 
 /*--*/
 
 select nombre_pro as d,
       nit_pro as r
  from proveedor
 order by 1
 
 /*--*/
 
 select nombre_se as d,
       id_se as r
  from sede 
 order by 1;
 
 /*------------------------------*/
 
 /*para mostar datos de un cambo de una tabla*/ 
 
 
select orden_factura_or as d,
       correlativo_apa as r
  from a_pagar
 order by 1
