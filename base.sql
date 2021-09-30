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

 Date: 29/09/2021 16:24:47
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
-- Sequence structure for prueba_incremento_id
-- ----------------------------
DROP SEQUENCE IF EXISTS "prueba_incremento_id";
CREATE SEQUENCE "prueba_incremento_id" 
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
  "id_actor" int2 NOT NULL DEFAULT nextval('id_actor'::regclass),
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
  "id_categoria" int2 NOT NULL DEFAULT nextval('id_categoria'::regclass),
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
  "id_cuidad" int2 NOT NULL DEFAULT nextval('id_ciudad'::regclass),
  "id_pais" int2 NOT NULL,
  "codigo_postal" int2,
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
  "id_cliente" int2 NOT NULL DEFAULT nextval('id_cliente'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "apellido" varchar(255) COLLATE "pg_catalog"."default",
  "correo" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_registro" date,
  "id_tienda" int2 NOT NULL
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
  "id_cliente" int2 NOT NULL,
  "id_direccion" int2 NOT NULL
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
  "id_direccion" int2 NOT NULL DEFAULT nextval('id_direccion'::regclass),
  "id_ciudad" int2 NOT NULL,
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
  "id_empleado" int2 NOT NULL DEFAULT nextval('id_empleado'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "apellido" varchar(255) COLLATE "pg_catalog"."default",
  "correo" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(255) COLLATE "pg_catalog"."default",
  "id_tienda" int2 NOT NULL,
  "user" varchar(255) COLLATE "pg_catalog"."default",
  "pass" varchar(255) COLLATE "pg_catalog"."default",
  "encargado" varchar(255) COLLATE "pg_catalog"."default"
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
  "id_empleado" int2 NOT NULL,
  "id_direccion" int2 NOT NULL
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
  "id_idioma" int2 NOT NULL DEFAULT nextval('id_idioma'::regclass),
  "idioma" varchar(255) COLLATE "pg_catalog"."default"
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
  "id_pais" int2 NOT NULL DEFAULT nextval('id_pais'::regclass),
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
  "id_pelicula" int2 NOT NULL DEFAULT nextval('id_pelicula'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "descripcion" varchar(255) COLLATE "pg_catalog"."default",
  "year_lanzamiento" int2,
  "dias_renta" int2,
  "costo" float4,
  "duracion" int2,
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
  "id_pelicula" int2 NOT NULL,
  "id_actor" int2 NOT NULL
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
  "id_pelicula" int2 NOT NULL,
  "id_categoria" int2 NOT NULL
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
  "id_pelicula" int2 NOT NULL,
  "id_idioma" int2 NOT NULL
)
;

-- ----------------------------
-- Records of pelicula_idioma
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prueba_incremento
-- ----------------------------
DROP TABLE IF EXISTS "prueba_incremento";
CREATE TABLE "prueba_incremento" (
  "id" int8 NOT NULL DEFAULT nextval('prueba_incremento_id'::regclass),
  "nombre" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "edad" int8 NOT NULL
)
;

-- ----------------------------
-- Records of prueba_incremento
-- ----------------------------
BEGIN;
INSERT INTO "prueba_incremento" VALUES (0, 'raul', 1);
INSERT INTO "prueba_incremento" VALUES (1, 'adriana', 40);
INSERT INTO "prueba_incremento" VALUES (2, 'adriana', 40);
INSERT INTO "prueba_incremento" VALUES (3, 'adriana', 40);
INSERT INTO "prueba_incremento" VALUES (4, 'adriana', 40);
COMMIT;

-- ----------------------------
-- Table structure for rentado
-- ----------------------------
DROP TABLE IF EXISTS "rentado";
CREATE TABLE "rentado" (
  "id_rentado" int2 NOT NULL DEFAULT nextval('id_rentado'::regclass),
  "fecha_renta" timestamp(6),
  "fecha_regreso" timestamp(6),
  "total" float4,
  "fecha_pago" timestamp(6),
  "id_cliente" int2 NOT NULL,
  "id_tienda" int2 NOT NULL,
  "id_empleado" int2 NOT NULL,
  "id_pelicula" int2 NOT NULL
)
;

-- ----------------------------
-- Records of rentado
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for temporal
-- ----------------------------
DROP TABLE IF EXISTS "temporal";
CREATE TABLE "temporal" (
  "nombre_cliente" varchar(255) COLLATE "pg_catalog"."default",
  "correo_cliente" varchar(255) COLLATE "pg_catalog"."default",
  "cliente_activo" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_creacion" varchar(255) COLLATE "pg_catalog"."default",
  "tienda_preferida" varchar(255) COLLATE "pg_catalog"."default",
  "direccion_cliente" varchar(255) COLLATE "pg_catalog"."default",
  "codigo_postal_cliente" varchar(255) COLLATE "pg_catalog"."default",
  "ciudad_cliente" varchar(255) COLLATE "pg_catalog"."default",
  "pais_cliente" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_renta" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_retorno" varchar(255) COLLATE "pg_catalog"."default",
  "monto_a_pagar" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_pago" varchar(255) COLLATE "pg_catalog"."default",
  "nombre_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "correo_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "empleado_activo" varchar(255) COLLATE "pg_catalog"."default",
  "tienda_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "usuario_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "contrasena_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "direccion_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "codigo_postal_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "ciudad_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "pais_empleado" varchar(255) COLLATE "pg_catalog"."default",
  "nombre_tienda" varchar(255) COLLATE "pg_catalog"."default",
  "encargado_tienda" varchar(255) COLLATE "pg_catalog"."default",
  "direccion_tienda" varchar(255) COLLATE "pg_catalog"."default",
  "codigo_postal_tienda" varchar(255) COLLATE "pg_catalog"."default",
  "ciudad_tienda" varchar(255) COLLATE "pg_catalog"."default",
  "pais_tienda" varchar(255) COLLATE "pg_catalog"."default",
  "tienda_pelicula" varchar(255) COLLATE "pg_catalog"."default",
  "nombre_pelicula" varchar(255) COLLATE "pg_catalog"."default",
  "descripcion_pelicula" varchar(255) COLLATE "pg_catalog"."default",
  "ano_lanzamiento" varchar(255) COLLATE "pg_catalog"."default",
  "dias_renta" varchar(255) COLLATE "pg_catalog"."default",
  "costo_renta" varchar(255) COLLATE "pg_catalog"."default",
  "duracion" varchar(255) COLLATE "pg_catalog"."default",
  "costo_por_dano" varchar(255) COLLATE "pg_catalog"."default",
  "clasificacion" varchar(255) COLLATE "pg_catalog"."default",
  "lenguaje_pelicula" varchar(255) COLLATE "pg_catalog"."default",
  "categoria_pelicula" varchar(255) COLLATE "pg_catalog"."default",
  "actor_pelicula" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of temporal
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tienda
-- ----------------------------
DROP TABLE IF EXISTS "tienda";
CREATE TABLE "tienda" (
  "id_tienda" int2 NOT NULL DEFAULT nextval('id_tienda'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "id_direccion" int2 NOT NULL
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
  "id_tienda" int2 NOT NULL,
  "id_pelicula" int2 NOT NULL,
  "cantidad" int2
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
SELECT setval('"id_actor"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_categoria"
OWNED BY "categoria"."id_categoria";
SELECT setval('"id_categoria"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_ciudad"
OWNED BY "ciudad"."id_cuidad";
SELECT setval('"id_ciudad"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_cliente"
OWNED BY "cliente"."id_cliente";
SELECT setval('"id_cliente"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_direccion"
OWNED BY "direccion"."id_direccion";
SELECT setval('"id_direccion"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_empleado"
OWNED BY "empleado"."id_empleado";
SELECT setval('"id_empleado"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_idioma"
OWNED BY "idioma"."id_idioma";
SELECT setval('"id_idioma"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_pais"
OWNED BY "pais"."id_pais";
SELECT setval('"id_pais"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_pelicula"
OWNED BY "pelicula"."id_pelicula";
SELECT setval('"id_pelicula"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_rentado"
OWNED BY "rentado"."id_rentado";
SELECT setval('"id_rentado"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "id_tienda"
OWNED BY "tienda"."id_tienda";
SELECT setval('"id_tienda"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "prueba_incremento_id"
OWNED BY "prueba_incremento"."id";
SELECT setval('"prueba_incremento_id"', 5, true);

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
ALTER TABLE "ciudad" ADD CONSTRAINT "ciudad_pkey" PRIMARY KEY ("id_cuidad");

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
-- Primary Key structure for table prueba_incremento
-- ----------------------------
ALTER TABLE "prueba_incremento" ADD CONSTRAINT "prueba_incremento_pkey" PRIMARY KEY ("id");

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
ALTER TABLE "direccion" ADD CONSTRAINT "id_ciudad" FOREIGN KEY ("id_ciudad") REFERENCES "ciudad" ("id_cuidad") ON DELETE CASCADE ON UPDATE NO ACTION;

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
