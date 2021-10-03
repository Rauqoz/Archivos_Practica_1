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


select count(*) from tienda_pelicula inner join pelicula on pelicula.id_pelicula=tienda_pelicula.id_pelicula where nombre='SUGAR WONKA'

select count(*) as rentas,concat(cliente.nombre,' ',cliente.apellido)nombre_apellido,sum(total) from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente group by nombre_apellido having count(*)>=40 order by count(*) asc

select concat(nombre,' ',apellido)nombre_completo from actor WHERE apellido ilike '%SON%' order by nombre

select actor.nombre, apellido from actor inner join pelicula_actor on pelicula_actor.id_actor=actor.id_actor inner join pelicula on pelicula_actor.id_pelicula=pelicula.id_pelicula where pelicula.descripcion ilike '%crocodile%' and pelicula.descripcion ilike '%shark%'

select count(*) as rentas,pais.nombre as pais,concat(cliente.nombre,' ',cliente.apellido) as nombre_cliente,(count(cp.id_pais)/count(*))*100 as porcentaje from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join (select count(pais.nombre),id_pais from pais group by id_pais) as cp on cp.id_pais=pais.id_pais group by pais.nombre,nombre_cliente,cp.id_pais ORDER BY rentas DESC limit 1 

select pais.nombre as pais,ciudad.nombre as ciudad,count(cliente.id_cliente) as cliente_por_ciudad, (count(cliente.id_cliente)/float8((select count(cliente.id_cliente) from cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais as pa on pa.id_pais=ciudad.id_pais where pa.id_pais=pais.id_pais group by pa.id_pais,pais.id_pais)))*100 as porcentaje_pais from ciudad join direccion on direccion.id_ciudad=ciudad.id_ciudad join pais on pais.id_pais=ciudad.id_pais join cliente_direccion on cliente_direccion.id_direccion=direccion.id_direccion join cliente on cliente.id_cliente=cliente_direccion.id_cliente group by pais.nombre,ciudad.nombre,pais.id_pais order by pais.nombre

select pais.nombre as pais,ciudad.nombre as ciudad, (count(rentado.id_rentado)/float8((select count(rentado.id_rentado) from cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais as pa on pa.id_pais=ciudad.id_pais inner join rentado on rentado.id_cliente=cliente.id_cliente where pa.id_pais=pais.id_pais group by pa.id_pais,pais.id_pais)))*100 as porcentaje_ciudad from ciudad join direccion on direccion.id_ciudad=ciudad.id_ciudad join pais on pais.id_pais=ciudad.id_pais join cliente_direccion on cliente_direccion.id_direccion=direccion.id_direccion join cliente on cliente.id_cliente=cliente_direccion.id_cliente inner join rentado on rentado.id_cliente=cliente.id_cliente group by pais.nombre,ciudad.nombre,pais.id_pais order by pais.nombre

select pais.nombre as pais,(count(rentado.id_rentado)/float8((select count(rentado.id_rentado) from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais as pa on pa.id_pais=ciudad.id_pais inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula inner join pelicula_categoria on pelicula_categoria.id_pelicula=pelicula.id_pelicula inner join categoria on categoria.id_categoria=pelicula_categoria.id_categoria where pa.id_pais=pais.id_pais group by pa.id_pais,pais.id_pais)))*100 as porcentaje from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula inner join pelicula_categoria on pelicula_categoria.id_pelicula=pelicula.id_pelicula inner join categoria on categoria.id_categoria=pelicula_categoria.id_categoria where categoria.categoria='Sports' group by pais.nombre,pais.id_pais order by porcentaje desc

select pais.nombre as pais,ciudad.nombre as ciudad, (select count(rentado.id_rentado) from cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad as ci on ci.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join rentado on rentado.id_cliente=cliente.id_cliente where ci.id_ciudad=ciudad.id_ciudad group by ci.id_ciudad,ciudad.id_ciudad ) as porcentaje_ciudad from ciudad join direccion on direccion.id_ciudad=ciudad.id_ciudad join pais on pais.id_pais=ciudad.id_pais join cliente_direccion on cliente_direccion.id_direccion=direccion.id_direccion join cliente on cliente.id_cliente=cliente_direccion.id_cliente inner join rentado on rentado.id_cliente=cliente.id_cliente where pais.nombre='United States' group by pais.nombre,ciudad.nombre,ciudad.id_ciudad having count(*)>26 order by ciudad.nombre

select pais.nombre as pais,ciudad.nombre as ciudad,(select count(rentado.id_rentado) from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad as ci on ci.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula inner join pelicula_categoria on pelicula_categoria.id_pelicula=pelicula.id_pelicula inner join categoria on categoria.id_categoria=pelicula_categoria.id_categoria where ci.id_ciudad=ciudad.id_ciudad  group by ci.id_ciudad,ciudad.id_ciudad order by count(rentado.id_rentado) asc limit 1) as cantidad from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula inner join pelicula_categoria on pelicula_categoria.id_pelicula=pelicula.id_pelicula inner join categoria on categoria.id_categoria=pelicula_categoria.id_categoria where categoria.categoria='Horror' group by pais.nombre,ciudad.nombre,ciudad.id_ciudad,cantidad order by pais.nombre asc

