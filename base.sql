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

 Date: 28/09/2021 21:46:46
*/


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
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "prueba_incremento_id"
OWNED BY "prueba_incremento"."id";
SELECT setval('"prueba_incremento_id"', 5, true);

-- ----------------------------
-- Primary Key structure for table prueba_incremento
-- ----------------------------
ALTER TABLE "prueba_incremento" ADD CONSTRAINT "prueba_incremento_pkey" PRIMARY KEY ("id");
