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

 Date: 29/09/2021 21:06:18
*/


-- ----------------------------
-- Sequence structure for id_actor
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_actor" CASCADE;
-- ----------------------------
-- Sequence structure for id_categoria
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_categoria" CASCADE;

-- ----------------------------
-- Sequence structure for id_ciudad
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_ciudad" CASCADE;

-- ----------------------------
-- Sequence structure for id_cliente
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_cliente" CASCADE;

-- ----------------------------
-- Sequence structure for id_direccion
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_direccion" CASCADE;

-- ----------------------------
-- Sequence structure for id_empleado
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_empleado" CASCADE;

-- ----------------------------
-- Sequence structure for id_idioma
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_idioma" CASCADE;

-- ----------------------------
-- Sequence structure for id_pais
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_pais" CASCADE;

-- ----------------------------
-- Sequence structure for id_pelicula
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_pelicula" CASCADE;

-- ----------------------------
-- Sequence structure for id_rentado
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_rentado" CASCADE;

-- ----------------------------
-- Sequence structure for id_tienda
-- ----------------------------
DROP SEQUENCE IF EXISTS "id_tienda" CASCADE;

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS "actor" CASCADE;

-- ----------------------------
-- Records of actor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS "categoria" CASCADE;

-- ----------------------------
-- Records of categoria
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS "ciudad" CASCADE;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS "cliente" CASCADE;

-- ----------------------------
-- Records of cliente
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cliente_direccion
-- ----------------------------
DROP TABLE IF EXISTS "cliente_direccion" CASCADE;

-- ----------------------------
-- Records of cliente_direccion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for direccion
-- ----------------------------
DROP TABLE IF EXISTS "direccion" CASCADE;

-- ----------------------------
-- Records of direccion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS "empleado" CASCADE;

-- ----------------------------
-- Records of empleado
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for empleado_direccion
-- ----------------------------
DROP TABLE IF EXISTS "empleado_direccion" CASCADE;

-- ----------------------------
-- Records of empleado_direccion
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for idioma
-- ----------------------------
DROP TABLE IF EXISTS "idioma" CASCADE;

-- ----------------------------
-- Records of idioma
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS "pais" CASCADE;

-- ----------------------------
-- Records of pais
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula
-- ----------------------------
DROP TABLE IF EXISTS "pelicula" CASCADE;

-- ----------------------------
-- Records of pelicula
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula_actor
-- ----------------------------
DROP TABLE IF EXISTS "pelicula_actor" CASCADE;

-- ----------------------------
-- Records of pelicula_actor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula_categoria
-- ----------------------------
DROP TABLE IF EXISTS "pelicula_categoria" CASCADE;

-- ----------------------------
-- Records of pelicula_categoria
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pelicula_idioma
-- ----------------------------
DROP TABLE IF EXISTS "pelicula_idioma" CASCADE;

-- ----------------------------
-- Records of pelicula_idioma
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rentado
-- ----------------------------
DROP TABLE IF EXISTS "rentado" CASCADE;

-- ----------------------------
-- Records of rentado
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tienda
-- ----------------------------
DROP TABLE IF EXISTS "tienda" CASCADE;

-- ----------------------------
-- Records of tienda
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tienda_pelicula
-- ----------------------------
DROP TABLE IF EXISTS "tienda_pelicula" CASCADE;

-- ----------------------------
-- Records of tienda_pelicula
-- ----------------------------
BEGIN;
COMMIT;
