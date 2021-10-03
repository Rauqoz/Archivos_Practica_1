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

 Date: 29/09/2021 21:06:52
*/


select * from idioma where nombre_idioma='{idioma}'

insert into idioma (nombre_idioma) values('{idioma}')

select * from actor where nombre='{actor[0]}' and apellido='{actor[1]}'

insert into actor (nombre, apellido) values('{actor[0]}','{actor[1]}') 

select * from categoria where categoria='{categoria}'

insert into categoria (categoria) values('{categoria}') 

select * from pais where nombre='{pais}'

insert into pais (nombre) values('{pais}')

select * from ciudad where nombre='{ciudad}'

insert into ciudad (id_pais, codigo_postal,nombre) (select id_pais,'{codigo_postal}','{ciudad}' from pais where pais.nombre = '{pais}')

insert into ciudad (id_pais, codigo_postal,nombre) (select id_pais,'0','{ciudad}' from pais where pais.nombre = '{pais}')

select * from direccion where direccion='{direccion}'

insert into direccion (id_ciudad, direccion) (select id_ciudad,'{direccion}' from ciudad where ciudad.nombre = '{ciudad}')

select * from tienda where nombre='{tienda}'

insert into tienda (nombre, id_direccion,n_encargado,a_encargado) (select '{tienda}',id_direccion,'{a_encargado[0]}','{a_encargado[1]}' from direccion where direccion.direccion = '{direccion}')

select * from pelicula where nombre='{nombre}'

insert into pelicula (nombre,descripcion,year_lanzamiento,dias_renta,costo,duracion,costo_mal_estado,clasificacion) values ('{nombre}','{descripcion}','{year}','{dias_renta}','{costo}','{duracion}','{costo_mal}','{clasificacion}')

select * from pelicula_idioma inner join pelicula on pelicula.id_pelicula=pelicula_idioma.id_pelicula inner join idioma on idioma.id_idioma=pelicula_idioma.id_idioma where pelicula.nombre = '{nombre}' and idioma.nombre_idioma='{idioma}'

insert into pelicula_idioma (id_pelicula,id_idioma) (select id_pelicula,id_idioma from pelicula,idioma where pelicula.nombre = '{nombre}' and idioma.nombre_idioma='{idioma}')

select * from pelicula_actor inner join pelicula on pelicula.id_pelicula=pelicula_actor.id_pelicula inner join actor on actor.id_actor=pelicula_actor.id_actor where pelicula.nombre = '{nombre}' and actor.nombre='{a_actor[0]}' and actor.apellido='{a_actor[1]}'

insert into pelicula_actor (id_pelicula,id_actor) (select id_pelicula,id_actor from pelicula,actor where pelicula.nombre = '{nombre}' and actor.nombre='{a_actor[0]}' and actor.apellido='{a_actor[1]}')

select * from pelicula_categoria inner join pelicula on pelicula.id_pelicula=pelicula_categoria.id_pelicula inner join categoria on categoria.id_categoria = pelicula_categoria.id_categoria where pelicula.nombre = '{nombre}' and categoria.categoria='{categoria}'

insert into pelicula_categoria (id_pelicula,id_categoria) (select id_pelicula,id_categoria from pelicula,categoria where pelicula.nombre = '{nombre}' and categoria.categoria='{categoria}')

select * from empleado where nombre='{a_empleado[0]}' and apellido='{a_empleado[1]}'

insert into empleado (nombre,apellido,correo,status,id_tienda,usuario,password) (select '{a_empleado[0]}','{a_empleado[1]}','{correo}','{status}',id_tienda,'{user}','{password}' from tienda where tienda.nombre='{tienda}')

select * from cliente where nombre='{a_cliente[0]}' and apellido='{a_cliente[1]}'

insert into cliente (nombre,apellido,correo,status,fecha_registro,id_tienda) (select '{a_cliente[0]}','{a_cliente[1]}','{correo}','{status}','{fecha}',id_tienda from tienda where tienda.nombre='{tienda}')

select * from empleado_direccion inner join empleado on empleado.id_empleado=empleado_direccion.id_empleado inner join direccion on direccion.id_direccion=empleado_direccion.id_direccion where empleado.nombre = '{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and direccion.direccion='{direccion}'

insert into empleado_direccion (id_empleado,id_direccion) (select id_empleado,id_direccion from empleado,direccion where empleado.nombre = '{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and direccion.direccion='{direccion}')

select * from cliente_direccion inner join cliente on cliente.id_cliente=cliente_direccion.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion where cliente.nombre = '{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and direccion.direccion='{direccion}'

insert into cliente_direccion (id_cliente,id_direccion) (select id_cliente,id_direccion from cliente,direccion where cliente.nombre = '{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and direccion.direccion='{direccion}')

select * from rentado inner join cliente on rentado.id_cliente=cliente.id_cliente inner join tienda on rentado.id_tienda=tienda.id_tienda inner join empleado on rentado.id_empleado=empleado.id_empleado inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula where rentado.fecha_renta='{fecha_renta}' and rentado.fecha_regreso='{fecha_regreso}' and rentado.total='{total}' and rentado.fecha_pago='{fecha_pago}' and cliente.nombre='{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and tienda.nombre='{tienda}' and empleado.nombre='{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and pelicula.nombre='{pelicula}'

select id_cliente,tienda.id_tienda,id_empleado,id_pelicula from cliente,tienda,empleado,pelicula where cliente.nombre='{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and tienda.nombre='{tienda}' and empleado.nombre='{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and pelicula.nombre='{pelicula}'

insert into rentado (fecha_renta,fecha_regreso,total,fecha_pago,id_cliente,id_tienda,id_empleado,id_pelicula) values ('{fecha_renta}','{fecha_regreso}','{total}','{fecha_pago}','{datos[0][0]}','{datos[0][1]}','{datos[0][2]}','{datos[0][3]}')

select * from tienda_pelicula inner join tienda on tienda.id_tienda=tienda_pelicula.id_tienda inner join pelicula on  pelicula.id_pelicula=tienda_pelicula.id_pelicula where tienda.nombre='{tienda}' and pelicula.nombre='{pelicula}' and tienda_pelicula.fecha='{fecha}'

insert into tienda_pelicula (id_tienda,id_pelicula,fecha) (select id_tienda,id_pelicula,'{fecha}' from tienda,pelicula where tienda.nombre='{tienda}' and pelicula.nombre='{pelicula}') 

