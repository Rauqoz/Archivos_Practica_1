/*
 Navicat PostgreSQL Data Transfer

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 120008
 Source Host           : localhost:5432
 Source Catalog        : blockbuster
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120008
 File Encoding         : 65001

 Date: 01/10/2021 00:12:57
*/


-- ----------------------------
-- Sequence structure for id_actor
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_actor";
CREATE SEQUENCE "id_actor" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_categoria
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_categoria";
CREATE SEQUENCE "id_categoria" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_ciudad
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_ciudad";
CREATE SEQUENCE "id_ciudad" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_cliente
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_cliente";
CREATE SEQUENCE "id_cliente" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_direccion
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_direccion";
CREATE SEQUENCE "id_direccion" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_empleado
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_empleado";
CREATE SEQUENCE "id_empleado" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_idioma
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_idioma";
CREATE SEQUENCE "id_idioma" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_pais
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_pais";
CREATE SEQUENCE "id_pais" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_pelicula
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_pelicula";
CREATE SEQUENCE "id_pelicula" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_rentado
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_rentado";
CREATE SEQUENCE "id_rentado" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for id_tienda
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_tienda";
CREATE SEQUENCE "id_tienda" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS "actor";
CREATE TABLE "actor" (
  "id_actor" int8 NOT NULL DEFAULT nextval('id_actor'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "apellido" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of actor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS "categoria";
CREATE TABLE "categoria" (
  "id_categoria" int8 NOT NULL DEFAULT nextval('id_categoria'::regclass),
  "categoria" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of categoria
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS "ciudad";
CREATE TABLE "ciudad" (
  "id_ciudad" int8 NOT NULL DEFAULT nextval('id_ciudad'::regclass),
  "id_pais" int8 NOT NULL,
  "codigo_postal" int8,
  "nombre" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS "cliente";
CREATE TABLE "cliente" (
  "id_cliente" int8 NOT NULL DEFAULT nextval('id_cliente'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "apellido" varchar(255) COLLATE "pg_catalog"."default",
  "correo" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_registro" date,
  "id_tienda" int8 NOT NULL
)
;

-- ----------------------------
-- Records of cliente
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente_direccion
-- ----------------------------
DROP TABLE IF EXISTS "cliente_direccion";
CREATE TABLE "cliente_direccion" (
  "id_cliente" int8 NOT NULL,
  "id_direccion" int8 NOT NULL
)
;

-- ----------------------------
-- Records of cliente_direccion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for direccion
-- ----------------------------
DROP TABLE IF EXISTS "direccion";
CREATE TABLE "direccion" (
  "id_direccion" int8 NOT NULL DEFAULT nextval('id_direccion'::regclass),
  "id_ciudad" int8 NOT NULL,
  "direccion" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of direccion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS "empleado";
CREATE TABLE "empleado" (
  "id_empleado" int8 NOT NULL DEFAULT nextval('id_empleado'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "apellido" varchar(255) COLLATE "pg_catalog"."default",
  "correo" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "id_tienda" int8 NOT NULL,
  "usuario" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of empleado
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for empleado_direccion
-- ----------------------------
DROP TABLE IF EXISTS "empleado_direccion";
CREATE TABLE "empleado_direccion" (
  "id_empleado" int8 NOT NULL,
  "id_direccion" int8 NOT NULL
)
;

-- ----------------------------
-- Records of empleado_direccion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for idioma
-- ----------------------------
DROP TABLE IF EXISTS "idioma";
CREATE TABLE "idioma" (
  "id_idioma" int8 NOT NULL DEFAULT nextval('id_idioma'::regclass),
  "nombre_idioma" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of idioma
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS "pais";
CREATE TABLE "pais" (
  "id_pais" int8 NOT NULL DEFAULT nextval('id_pais'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of pais
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula
-- ----------------------------
DROP TABLE IF EXISTS "pelicula";
CREATE TABLE "pelicula" (
  "id_pelicula" int8 NOT NULL DEFAULT nextval('id_pelicula'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "descripcion" varchar(255) COLLATE "pg_catalog"."default",
  "year_lanzamiento" int8,
  "dias_renta" int8,
  "costo" float4,
  "duracion" int8,
  "costo_mal_estado" float4,
  "clasificacion" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of pelicula
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula_actor
-- ----------------------------
DROP TABLE IF EXISTS "pelicula_actor";
CREATE TABLE "pelicula_actor" (
  "id_pelicula" int8 NOT NULL,
  "id_actor" int8 NOT NULL
)
;

-- ----------------------------
-- Records of pelicula_actor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula_categoria
-- ----------------------------
DROP TABLE IF EXISTS "pelicula_categoria";
CREATE TABLE "pelicula_categoria" (
  "id_pelicula" int8 NOT NULL,
  "id_categoria" int8 NOT NULL
)
;

-- ----------------------------
-- Records of pelicula_categoria
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula_idioma
-- ----------------------------
DROP TABLE IF EXISTS "pelicula_idioma";
CREATE TABLE "pelicula_idioma" (
  "id_pelicula" int8 NOT NULL,
  "id_idioma" int8 NOT NULL
)
;

-- ----------------------------
-- Records of pelicula_idioma
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rentado
-- ----------------------------
DROP TABLE IF EXISTS "rentado";
CREATE TABLE "rentado" (
  "id_rentado" int8 NOT NULL DEFAULT nextval('id_rentado'::regclass),
  "fecha_renta" timestamp(6),
  "fecha_regreso" timestamp(6),
  "total" float4,
  "fecha_pago" timestamp(6),
  "id_cliente" int8 NOT NULL,
  "id_tienda" int8 NOT NULL,
  "id_empleado" int8 NOT NULL,
  "id_pelicula" int8 NOT NULL
)
;

-- ----------------------------
-- Records of rentado
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tienda
-- ----------------------------
DROP TABLE IF EXISTS "tienda";
CREATE TABLE "tienda" (
  "id_tienda" int8 NOT NULL DEFAULT nextval('id_tienda'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "id_direccion" int8 NOT NULL,
  "n_encargado" varchar(255) COLLATE "pg_catalog"."default",
  "a_encargado" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of tienda
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tienda_pelicula
-- ----------------------------
DROP TABLE IF EXISTS "tienda_pelicula";
CREATE TABLE "tienda_pelicula" (
  "id_tienda" int8 NOT NULL,
  "id_pelicula" int8 NOT NULL,
  "cantidad" int8
)
;

-- ----------------------------
-- Records of tienda_pelicula
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_actor"
OWNED BY "actor"."id_actor";
SELECT setval('"id_actor"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_categoria"
OWNED BY "categoria"."id_categoria";
SELECT setval('"id_categoria"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_ciudad"
OWNED BY "ciudad"."id_ciudad";
SELECT setval('"id_ciudad"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_cliente"
OWNED BY "cliente"."id_cliente";
SELECT setval('"id_cliente"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_direccion"
OWNED BY "direccion"."id_direccion";
SELECT setval('"id_direccion"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_empleado"
OWNED BY "empleado"."id_empleado";
SELECT setval('"id_empleado"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_idioma"
OWNED BY "idioma"."id_idioma";
SELECT setval('"id_idioma"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_pais"
OWNED BY "pais"."id_pais";
SELECT setval('"id_pais"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_pelicula"
OWNED BY "pelicula"."id_pelicula";
SELECT setval('"id_pelicula"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_rentado"
OWNED BY "rentado"."id_rentado";
SELECT setval('"id_rentado"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_tienda"
OWNED BY "tienda"."id_tienda";
SELECT setval('"id_tienda"', 6, false);

-- ----------------------------
-- Primary Key structure for table actor
-- ----------------------------
ALTER TABLE "actor" ADD CONSTRAINT "actor_pkey" PRIMARY KEY ("id_actor");

-- ----------------------------
-- Primary Key structure for table categoria
-- ----------------------------
ALTER TABLE "categoria" ADD CONSTRAINT "categoria_pkey" PRIMARY KEY ("id_categoria");

-- ----------------------------
-- Primary Key structure for table ciudad
-- ----------------------------
ALTER TABLE "ciudad" ADD CONSTRAINT "ciudad_pkey" PRIMARY KEY ("id_ciudad");

-- ----------------------------
-- Primary Key structure for table cliente
-- ----------------------------
ALTER TABLE "cliente" ADD CONSTRAINT "cliente_pkey" PRIMARY KEY ("id_cliente");

-- ----------------------------
-- Primary Key structure for table direccion
-- ----------------------------
ALTER TABLE "direccion" ADD CONSTRAINT "direccion_pkey" PRIMARY KEY ("id_direccion");

-- ----------------------------
-- Primary Key structure for table empleado
-- ----------------------------
ALTER TABLE "empleado" ADD CONSTRAINT "empleado_pkey" PRIMARY KEY ("id_empleado");

-- ----------------------------
-- Primary Key structure for table idioma
-- ----------------------------
ALTER TABLE "idioma" ADD CONSTRAINT "idioma_pkey" PRIMARY KEY ("id_idioma");

-- ----------------------------
-- Primary Key structure for table pais
-- ----------------------------
ALTER TABLE "pais" ADD CONSTRAINT "pais_pkey" PRIMARY KEY ("id_pais");

-- ----------------------------
-- Primary Key structure for table pelicula
-- ----------------------------
ALTER TABLE "pelicula" ADD CONSTRAINT "pelicula_pkey" PRIMARY KEY ("id_pelicula");

-- ----------------------------
-- Primary Key structure for table rentado
-- ----------------------------
ALTER TABLE "rentado" ADD CONSTRAINT "rentado_pkey" PRIMARY KEY ("id_rentado");

-- ----------------------------
-- Primary Key structure for table tienda
-- ----------------------------
ALTER TABLE "tienda" ADD CONSTRAINT "tienda_pkey" PRIMARY KEY ("id_tienda");

-- ----------------------------
-- Foreign Keys structure for table ciudad
-- ----------------------------
ALTER TABLE "ciudad" ADD CONSTRAINT "id_pais" FOREIGN KEY ("id_pais") REFERENCES "pais" ("id_pais") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cliente
-- ----------------------------
ALTER TABLE "cliente" ADD CONSTRAINT "id_tienda" FOREIGN KEY ("id_tienda") REFERENCES "tienda" ("id_tienda") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cliente_direccion
-- ----------------------------
ALTER TABLE "cliente_direccion" ADD CONSTRAINT "id_cliente" FOREIGN KEY ("id_cliente") REFERENCES "cliente" ("id_cliente") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "cliente_direccion" ADD CONSTRAINT "id_direccion" FOREIGN KEY ("id_direccion") REFERENCES "direccion" ("id_direccion") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table direccion
-- ----------------------------
ALTER TABLE "direccion" ADD CONSTRAINT "id_ciudad" FOREIGN KEY ("id_ciudad") REFERENCES "ciudad" ("id_ciudad") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table empleado
-- ----------------------------
ALTER TABLE "empleado" ADD CONSTRAINT "id_tienda" FOREIGN KEY ("id_tienda") REFERENCES "tienda" ("id_tienda") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table empleado_direccion
-- ----------------------------
ALTER TABLE "empleado_direccion" ADD CONSTRAINT "id_direccion" FOREIGN KEY ("id_direccion") REFERENCES "direccion" ("id_direccion") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "empleado_direccion" ADD CONSTRAINT "id_empleado" FOREIGN KEY ("id_empleado") REFERENCES "empleado" ("id_empleado") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table pelicula_actor
-- ----------------------------
ALTER TABLE "pelicula_actor" ADD CONSTRAINT "id_actor" FOREIGN KEY ("id_actor") REFERENCES "actor" ("id_actor") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "pelicula_actor" ADD CONSTRAINT "id_pelicula" FOREIGN KEY ("id_pelicula") REFERENCES "pelicula" ("id_pelicula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table pelicula_categoria
-- ----------------------------
ALTER TABLE "pelicula_categoria" ADD CONSTRAINT "id_categoria" FOREIGN KEY ("id_categoria") REFERENCES "categoria" ("id_categoria") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "pelicula_categoria" ADD CONSTRAINT "id_pelicula" FOREIGN KEY ("id_pelicula") REFERENCES "pelicula" ("id_pelicula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table pelicula_idioma
-- ----------------------------
ALTER TABLE "pelicula_idioma" ADD CONSTRAINT "id_idioma" FOREIGN KEY ("id_idioma") REFERENCES "idioma" ("id_idioma") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "pelicula_idioma" ADD CONSTRAINT "id_pelicula" FOREIGN KEY ("id_pelicula") REFERENCES "pelicula" ("id_pelicula") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rentado
-- ----------------------------
ALTER TABLE "rentado" ADD CONSTRAINT "id_cliente" FOREIGN KEY ("id_cliente") REFERENCES "cliente" ("id_cliente") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rentado" ADD CONSTRAINT "id_empleado" FOREIGN KEY ("id_empleado") REFERENCES "empleado" ("id_empleado") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rentado" ADD CONSTRAINT "id_pelicula" FOREIGN KEY ("id_pelicula") REFERENCES "pelicula" ("id_pelicula") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "rentado" ADD CONSTRAINT "id_tienda" FOREIGN KEY ("id_tienda") REFERENCES "tienda" ("id_tienda") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tienda
-- ----------------------------
ALTER TABLE "tienda" ADD CONSTRAINT "id_direccion" FOREIGN KEY ("id_direccion") REFERENCES "direccion" ("id_direccion") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table tienda_pelicula
-- ----------------------------
ALTER TABLE "tienda_pelicula" ADD CONSTRAINT "id_pelicula" FOREIGN KEY ("id_pelicula") REFERENCES "pelicula" ("id_pelicula") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "tienda_pelicula" ADD CONSTRAINT "id_tienda" FOREIGN KEY ("id_tienda") REFERENCES "tienda" ("id_tienda") ON DELETE CASCADE ON UPDATE NO ACTION;
