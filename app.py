from flask import Flask
import psycopg2
import json

app = Flask(__name__)

conexion = psycopg2.connect(host="localhost", database="blockbuster", user="postgres", password="raul13202")
cur = conexion.cursor()


@app.route("/")
def hello_world():
    print("inicio conexion")

    cur.execute( "select * from prueba_incremento where nombre='rau'")

    arreglo = cur.fetchall()
    #for id,nombre,edad in arreglo:
    #    print(id,nombre,edad)
    print(arreglo[0])
    print(arreglo[0][0])
        
    cur.execute( "select * from prueba_incremento where nombre='adriana'")

    arreglo2 = cur.fetchall()
    

    x = 'hola'
    print(f"nel o {x}")

    return {"step": "Home"}

@app.route("/insertar")
def insertar():
    print("inicio conexion")
    
    cur.execute("INSERT INTO prueba_incremento (nombre,edad) VALUES('adriana',40)")
    conexion.commit() # <- We MUST commit to reflect the inserted data

    return {"step": "insertar"}

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
