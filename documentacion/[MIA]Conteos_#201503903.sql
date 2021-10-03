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

select count(*) from actor

select count(*) from categoria

select count(*) from ciudad

select count(*) from cliente

select count(*) from cliente_direccion

select count(*) from direccion

select count(*) from empleado

select count(*) from empleado_direccion

select count(*) from idioma

select count(*) from pais

select count(*) from pelicula

select count(*) from pelicula_actor

select count(*) from pelicula_categoria

select count(*) from pelicula_idioma

select count(*) from rentado

select count(*) from temporal

select count(*) from tienda

select count(*) from tienda_pelicula
