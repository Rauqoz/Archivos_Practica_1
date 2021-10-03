from flask import Flask,request,render_template
from flask.helpers import make_response
import psycopg2
import json

app = Flask(__name__)

conexion = psycopg2.connect(host="localhost", database="blockbuster", user="postgres", password="raul13202")
cur = conexion.cursor()


@app.route("/")
def hello_world():
    print("inicio conexion")
    return {"step": "home"}

@app.route("/eliminarTemporal")
def eliminarTemporal():
    print("inicio conexion")

    cur.execute(open("./limpiar_temporal.sql", "r").read())
    conexion.commit() # <- We MUST commit to reflect the inserted data

    return {"step": "eliminarTemporal"}

@app.route("/cargarTemporal")
def cargarTemporal():
    print("inicio conexion")
    file = "./BlockbusterData.csv"
    with open(file, 'r',encoding="latin-1") as f:
        next(f) # Skip the header row.
        #f , <database name>, Comma-Seperated
        cur.copy_from(f, 'temporal', sep=';')
        #Commit Changes
        conexion.commit() # <- We MUST commit to reflect the inserted data
    return {"step": "cargarTemporal"}

@app.route("/eliminarModelo")
def eliminarModelo():
    print("inicio conexion")

    cur.execute(open("./eliminar_base.sql", "r").read())
    conexion.commit() # <- We MUST commit to reflect the inserted data
    #cur.execute(open("./base.sql", "r").read())
    #conexion.commit() # <- We MUST commit to reflect the inserted data

    return {"step": "eliminarModelo"}

@app.route("/cargarModelo")
def cargarModelo():
    print("inicio conexion")

    cur.execute(open("./base.sql", "r").read())
    conexion.commit() # <- We MUST commit to reflect the inserted data


    #empieza carga de temporal al modelo
    cur.execute( "SELECT * FROM temporal")
    temporal = cur.fetchall()

    for nombre_cliente, correo_cliente, cliente_activo, fecha_creacion, tienda_preferida, direccion_cliente, codigo_postal_cliente, ciudad_cliente, pais_cliente, fecha_renta, fecha_retorno, monto_a_pagar, fecha_pago, nombre_empleado, correo_empleado, empleado_activo, tienda_empleado, usuario_empleado, contrasena_empleado, direccion_empleado, codigo_postal_empleado, ciudad_empleado, pais_empleado, nombre_tienda, encargado_tienda, direccion_tienda, codigo_postal_tienda, ciudad_tienda, pais_tienda, tienda_pelicula, nombre_pelicula, descripcion_pelicula, ano_lanzamiento, dias_renta, costo_renta, duracion, costo_por_dano, clasificacion, lenguaje_pelicula, categoria_pelicula, actor_pelicula  in temporal :
        llenar_idioma(lenguaje_pelicula)
        llenar_actor(actor_pelicula)
        llenar_categoria(categoria_pelicula)
        llenar_pais(pais_cliente)
        llenar_pais(pais_empleado)
        llenar_pais(pais_tienda)
        llenar_ciudad(ciudad_cliente,codigo_postal_cliente,pais_cliente)
        llenar_ciudad(ciudad_empleado,codigo_postal_empleado,pais_empleado)
        llenar_ciudad(ciudad_tienda,codigo_postal_tienda,pais_tienda)
        llenar_direccion(direccion_cliente,ciudad_cliente)
        llenar_direccion(direccion_empleado,ciudad_empleado)
        llenar_direccion(direccion_tienda,ciudad_tienda)
        llenar_tienda(nombre_tienda,direccion_tienda,encargado_tienda)
        llenar_pelicula(nombre_pelicula,descripcion_pelicula,ano_lanzamiento,dias_renta,costo_renta,duracion,costo_por_dano,clasificacion)
        llenar_pelicula_idioma(nombre_pelicula,lenguaje_pelicula)
        llenar_pelicula_actor(nombre_pelicula,actor_pelicula)
        llenar_pelicula_categoria(nombre_pelicula,categoria_pelicula)
        llenar_empleado(nombre_empleado,correo_empleado,empleado_activo,tienda_empleado,usuario_empleado,contrasena_empleado)
        llenar_cliente(nombre_cliente,correo_cliente,cliente_activo,fecha_creacion,tienda_preferida)
        llenar_empleado_direccion(nombre_empleado,direccion_empleado)
        llenar_cliente_direccion(nombre_cliente,direccion_cliente)
        llenar_tienda_pelicula(tienda_pelicula,nombre_pelicula,fecha_renta)

    cur.execute( "SELECT * FROM temporal")
    temporal = cur.fetchall()

    for nombre_cliente, correo_cliente, cliente_activo, fecha_creacion, tienda_preferida, direccion_cliente, codigo_postal_cliente, ciudad_cliente, pais_cliente, fecha_renta, fecha_retorno, monto_a_pagar, fecha_pago, nombre_empleado, correo_empleado, empleado_activo, tienda_empleado, usuario_empleado, contrasena_empleado, direccion_empleado, codigo_postal_empleado, ciudad_empleado, pais_empleado, nombre_tienda, encargado_tienda, direccion_tienda, codigo_postal_tienda, ciudad_tienda, pais_tienda, tienda_pelicula, nombre_pelicula, descripcion_pelicula, ano_lanzamiento, dias_renta, costo_renta, duracion, costo_por_dano, clasificacion, lenguaje_pelicula, categoria_pelicula, actor_pelicula  in temporal :
        llenar_rentado(fecha_renta,fecha_retorno,monto_a_pagar,fecha_pago,nombre_cliente,tienda_pelicula,nombre_empleado,nombre_pelicula)



    return {"step": "cargarModelo"}


def llenar_idioma(idioma):
    cur.execute(f"select * from idioma where nombre_idioma='{idioma}'")
    if len(cur.fetchall()) == 0 and idioma != '-':
        cur.execute(f"insert into idioma (nombre_idioma) values('{idioma}') ")
        conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_actor(actor_pelicula):
    if actor_pelicula != '-':
        actor = actor_pelicula.split()
        cur.execute(f"select * from actor where nombre='{actor[0]}' and apellido='{actor[1]}'")
        if len(cur.fetchall()) == 0:
            cur.execute(f"insert into actor (nombre, apellido) values('{actor[0]}','{actor[1]}') ")
            conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_categoria(categoria):
    cur.execute(f"select * from categoria where categoria='{categoria}'")
    if len(cur.fetchall()) == 0 and categoria != '-':
        cur.execute(f"insert into categoria (categoria) values('{categoria}') ")
        conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_pais(pais):
    cur.execute(f"select * from pais where nombre='{pais}'")
    if len(cur.fetchall()) == 0 and pais != '-':
        cur.execute(f"insert into pais (nombre) values('{pais}') ")
        conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_ciudad(ciudad,codigo_postal,pais):
    cur.execute(f"select * from ciudad where nombre='{ciudad}'")
    if len(cur.fetchall()) == 0 and ciudad != '-':
        if codigo_postal != '-':
            cur.execute(f"insert into ciudad (id_pais, codigo_postal,nombre) (select id_pais,'{codigo_postal}','{ciudad}' from pais where pais.nombre = '{pais}')")
        else:
            cur.execute(f"insert into ciudad (id_pais, codigo_postal,nombre) (select id_pais,'0','{ciudad}' from pais where pais.nombre = '{pais}')")
        conexion.commit() # <- We MUST commit to reflect the inserted data
        
def llenar_direccion(direccion,ciudad):
    cur.execute(f"select * from direccion where direccion='{direccion}'")
    if len(cur.fetchall()) == 0 and direccion != '-':
        cur.execute(f"insert into direccion (id_ciudad, direccion) (select id_ciudad,'{direccion}' from ciudad where ciudad.nombre = '{ciudad}')")
        conexion.commit() # <- We MUST commit to reflect the inserted data
                
def llenar_tienda(tienda,direccion,encargado):
    if encargado != '-':
        a_encargado = encargado.split()
        cur.execute(f"select * from tienda where nombre='{tienda}'")
        if len(cur.fetchall()) == 0 and tienda != '-':
            cur.execute(f"insert into tienda (nombre, id_direccion,n_encargado,a_encargado) (select '{tienda}',id_direccion,'{a_encargado[0]}','{a_encargado[1]}' from direccion where direccion.direccion = '{direccion}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data
                
def llenar_pelicula(nombre,descripcion,year,dias_renta,costo,duracion,costo_mal,clasificacion):
    cur.execute(f"select * from pelicula where nombre='{nombre}'")
    if len(cur.fetchall()) == 0 and nombre != '-':
        cur.execute(f"insert into pelicula (nombre,descripcion,year_lanzamiento,dias_renta,costo,duracion,costo_mal_estado,clasificacion) values ('{nombre}','{descripcion}','{year}','{dias_renta}','{costo}','{duracion}','{costo_mal}','{clasificacion}')")
        conexion.commit() # <- We MUST commit to reflect the inserted data
   
def llenar_pelicula_idioma(nombre,idioma):
    cur.execute(f"select * from pelicula_idioma inner join pelicula on pelicula.id_pelicula=pelicula_idioma.id_pelicula inner join idioma on idioma.id_idioma=pelicula_idioma.id_idioma where pelicula.nombre = '{nombre}' and idioma.nombre_idioma='{idioma}'")
    if len(cur.fetchall()) == 0 and nombre != '-' and idioma != '-':
        cur.execute(f"insert into pelicula_idioma (id_pelicula,id_idioma) (select id_pelicula,id_idioma from pelicula,idioma where pelicula.nombre = '{nombre}' and idioma.nombre_idioma='{idioma}')")
        conexion.commit() # <- We MUST commit to reflect the inserted data


def llenar_pelicula_actor(nombre,actor_pelicula):
    if actor_pelicula != '-' and nombre != '-':
        a_actor = actor_pelicula.split()
        cur.execute(f"select * from pelicula_actor inner join pelicula on pelicula.id_pelicula=pelicula_actor.id_pelicula inner join actor on actor.id_actor=pelicula_actor.id_actor where pelicula.nombre = '{nombre}' and actor.nombre='{a_actor[0]}' and actor.apellido='{a_actor[1]}'")
        if len(cur.fetchall()) == 0:
            cur.execute(f"insert into pelicula_actor (id_pelicula,id_actor) (select id_pelicula,id_actor from pelicula,actor where pelicula.nombre = '{nombre}' and actor.nombre='{a_actor[0]}' and actor.apellido='{a_actor[1]}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data


def llenar_pelicula_categoria(nombre,categoria):
    cur.execute(f"select * from pelicula_categoria inner join pelicula on pelicula.id_pelicula=pelicula_categoria.id_pelicula inner join categoria on categoria.id_categoria = pelicula_categoria.id_categoria where pelicula.nombre = '{nombre}' and categoria.categoria='{categoria}'")
    if len(cur.fetchall()) == 0 and nombre != '-' and categoria != '-':
        cur.execute(f"insert into pelicula_categoria (id_pelicula,id_categoria) (select id_pelicula,id_categoria from pelicula,categoria where pelicula.nombre = '{nombre}' and categoria.categoria='{categoria}')")
        conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_empleado(empleado,correo,status,tienda,user,password):
    if empleado != '-':
        a_empleado = empleado.split()
        cur.execute(f"select * from empleado where nombre='{a_empleado[0]}' and apellido='{a_empleado[1]}'")
        if len(cur.fetchall()) == 0 and status != '-' and tienda != '-' and user != '-' and password != '-':
            cur.execute(f"insert into empleado (nombre,apellido,correo,status,id_tienda,usuario,password) (select '{a_empleado[0]}','{a_empleado[1]}','{correo}','{status}',id_tienda,'{user}','{password}' from tienda where tienda.nombre='{tienda}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_cliente(cliente,correo,status,fecha,tienda):
    if cliente != '-':
        a_cliente = cliente.split()
        cur.execute(f"select * from cliente where nombre='{a_cliente[0]}' and apellido='{a_cliente[1]}'")
        if len(cur.fetchall()) == 0 and status != '-' and fecha != '-' and tienda != '-':
            cur.execute(f"insert into cliente (nombre,apellido,correo,status,fecha_registro,id_tienda) (select '{a_cliente[0]}','{a_cliente[1]}','{correo}','{status}','{fecha}',id_tienda from tienda where tienda.nombre='{tienda}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data


def llenar_empleado_direccion(empleado,direccion):
    if empleado != '-' and direccion != '-':
        a_empleado = empleado.split()
        cur.execute(f"select * from empleado_direccion inner join empleado on empleado.id_empleado=empleado_direccion.id_empleado inner join direccion on direccion.id_direccion=empleado_direccion.id_direccion where empleado.nombre = '{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and direccion.direccion='{direccion}'")
        if len(cur.fetchall()) == 0:
            cur.execute(f"insert into empleado_direccion (id_empleado,id_direccion) (select id_empleado,id_direccion from empleado,direccion where empleado.nombre = '{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and direccion.direccion='{direccion}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_cliente_direccion(cliente,direccion):
    if cliente != '-' and direccion != '-':
        a_cliente = cliente.split()
        cur.execute(f"select * from cliente_direccion inner join cliente on cliente.id_cliente=cliente_direccion.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion where cliente.nombre = '{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and direccion.direccion='{direccion}'")
        if len(cur.fetchall()) == 0:
            cur.execute(f"insert into cliente_direccion (id_cliente,id_direccion) (select id_cliente,id_direccion from cliente,direccion where cliente.nombre = '{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and direccion.direccion='{direccion}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_rentado(fecha_renta,fecha_regreso,total,fecha_pago,cliente,tienda,empleado,pelicula):
    if fecha_renta != '-' and fecha_regreso != '-' and total != '-' and fecha_pago != '-' and cliente != '-' and tienda != '-' and empleado != '-' and pelicula != '-':
        a_cliente = cliente.split()
        a_empleado = empleado.split()
        cur.execute(f"select * from rentado inner join cliente on rentado.id_cliente=cliente.id_cliente inner join tienda on rentado.id_tienda=tienda.id_tienda inner join empleado on rentado.id_empleado=empleado.id_empleado inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula where rentado.fecha_renta='{fecha_renta}' and rentado.fecha_regreso='{fecha_regreso}' and rentado.total='{total}' and rentado.fecha_pago='{fecha_pago}' and cliente.nombre='{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and tienda.nombre='{tienda}' and empleado.nombre='{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and pelicula.nombre='{pelicula}'")
        if len(cur.fetchall()) == 0:
            #select * from rentado inner join cliente on rentado.id_cliente=cliente.id_cliente inner join tienda on rentado.id_tienda=tienda.id_tienda inner join empleado on rentado.id_empleado=empleado.id_empleado inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula where rentado.fecha_renta='24/05/2005 22:53' and rentado.fecha_regreso='26/05/2005 22:04' and rentado.total='2.99' and rentado.fecha_pago='24/05/2005 22:53' and cliente.nombre='Charlotte' and cliente.apellido='Hunter' and tienda.nombre='Tienda 1' and empleado.nombre='Mike' and empleado.apellido='Hillyer' and pelicula.nombre='BLANKET BEVERLY'
            cur.execute(f"select id_cliente,tienda.id_tienda,id_empleado,id_pelicula from cliente,tienda,empleado,pelicula where cliente.nombre='{a_cliente[0]}' and cliente.apellido='{a_cliente[1]}' and tienda.nombre='{tienda}' and empleado.nombre='{a_empleado[0]}' and empleado.apellido='{a_empleado[1]}' and pelicula.nombre='{pelicula}'")
            datos = cur.fetchall()
            cur.execute(f"insert into rentado (fecha_renta,fecha_regreso,total,fecha_pago,id_cliente,id_tienda,id_empleado,id_pelicula) values ('{fecha_renta}','{fecha_regreso}','{total}','{fecha_pago}','{datos[0][0]}','{datos[0][1]}','{datos[0][2]}','{datos[0][3]}')")
            conexion.commit() # <- We MUST commit to reflect the inserted data

def llenar_tienda_pelicula(tienda,pelicula,fecha):
    if tienda != '-' and pelicula != '-' and fecha != '-':
        cur.execute(f"select * from tienda_pelicula inner join tienda on tienda.id_tienda=tienda_pelicula.id_tienda inner join pelicula on  pelicula.id_pelicula=tienda_pelicula.id_pelicula where tienda.nombre='{tienda}' and pelicula.nombre='{pelicula}' and tienda_pelicula.fecha='{fecha}'")
        if len(cur.fetchall()) == 0:
            #no esta el dato, se necesita insertar nuevo
            cur.execute(f"insert into tienda_pelicula (id_tienda,id_pelicula,fecha) (select id_tienda,id_pelicula,'{fecha}' from tienda,pelicula where tienda.nombre='{tienda}' and pelicula.nombre='{pelicula}') ")
            conexion.commit() # <- We MUST commit to reflect the inserted data

@app.route("/consulta1")
def consulta1():
    cur.execute(f"select count(*) from tienda_pelicula inner join pelicula on pelicula.id_pelicula=tienda_pelicula.id_pelicula where nombre='SUGAR WONKA'")
    return {"cantidad":cur.fetchall()[0][0]}

@app.route("/consulta2")
def consulta2():
    cur.execute(f"select count(*) as rentas,concat(cliente.nombre,' ',cliente.apellido)nombre_apellido,sum(total) from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente group by nombre_apellido having count(*)>=40 order by count(*) asc")
    datos = cur.fetchall()
    return {"datos":datos}

@app.route("/consulta3")
def consulta3():
    cur.execute(f"select concat(nombre,' ',apellido)nombre_completo from actor WHERE apellido ilike '%SON%' order by nombre")
    datos = cur.fetchall()
    return {"datos":datos}

@app.route("/consulta4")
def consulta4():
    cur.execute(f"select actor.nombre, apellido from actor inner join pelicula_actor on pelicula_actor.id_actor=actor.id_actor inner join pelicula on pelicula_actor.id_pelicula=pelicula.id_pelicula where pelicula.descripcion ilike '%crocodile%' and pelicula.descripcion ilike '%shark%'")
    datos = cur.fetchall()
    return {"datos":datos}

@app.route("/consulta5")
def consulta5():
    cur.execute(f"select count(*) as rentas,pais.nombre as pais,concat(cliente.nombre,' ',cliente.apellido) as nombre_cliente,(count(cp.id_pais)/count(*))*100 as porcentaje from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join (select count(pais.nombre),id_pais from pais group by id_pais) as cp on cp.id_pais=pais.id_pais group by pais.nombre,nombre_cliente,cp.id_pais ORDER BY rentas DESC limit 1 ")
    datos = cur.fetchall()
    return {"datos":datos}

@app.route("/consulta6")
def consulta6():
    cur.execute(f"select pais.nombre as pais,ciudad.nombre as ciudad,count(cliente.id_cliente) as cliente_por_ciudad, (count(cliente.id_cliente)/float8((select count(cliente.id_cliente) from cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais as pa on pa.id_pais=ciudad.id_pais where pa.id_pais=pais.id_pais group by pa.id_pais,pais.id_pais)))*100 as porcentaje_pais from ciudad join direccion on direccion.id_ciudad=ciudad.id_ciudad join pais on pais.id_pais=ciudad.id_pais join cliente_direccion on cliente_direccion.id_direccion=direccion.id_direccion join cliente on cliente.id_cliente=cliente_direccion.id_cliente group by pais.nombre,ciudad.nombre,pais.id_pais order by pais.nombre")
    datos = cur.fetchall()
    return {"datos":datos}

@app.route("/consulta8")
def consulta8():
    cur.execute(f"select pais.nombre as pais,(count(rentado.id_rentado)/float8((select count(rentado.id_rentado) from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais as pa on pa.id_pais=ciudad.id_pais inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula inner join pelicula_categoria on pelicula_categoria.id_pelicula=pelicula.id_pelicula inner join categoria on categoria.id_categoria=pelicula_categoria.id_categoria where pa.id_pais=pais.id_pais group by pa.id_pais,pais.id_pais)))*100 as porcentaje from rentado inner join cliente on cliente.id_cliente=rentado.id_cliente inner join cliente_direccion on cliente_direccion.id_cliente=cliente.id_cliente inner join direccion on direccion.id_direccion=cliente_direccion.id_direccion inner join ciudad on ciudad.id_ciudad=direccion.id_ciudad inner join pais on pais.id_pais=ciudad.id_pais inner join pelicula on pelicula.id_pelicula=rentado.id_pelicula inner join pelicula_categoria on pelicula_categoria.id_pelicula=pelicula.id_pelicula inner join categoria on categoria.id_categoria=pelicula_categoria.id_categoria where categoria.categoria='Sports' group by pais.nombre,pais.id_pais order by porcentaje desc")
    datos = cur.fetchall()
    return {"datos":datos}
