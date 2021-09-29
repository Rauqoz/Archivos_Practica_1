from flask import Flask
import psycopg2

app = Flask(__name__)

conexion = psycopg2.connect(host="localhost", database="blockbuster", user="postgres", password="raul13202")
cur = conexion.cursor()


@app.route("/")
def hello_world():
    print("inicio conexion")
    
    cur.execute( "SELECT * FROM prueba" )
    for nombre_fefa, edad_fjasdfa in cur.fetchall() :
        print(nombre_fefa, edad_fjasdfa)

    return {"step": "mostrar"}

@app.route("/insertar")
def insertar():
    print("inicio conexion")
    
    cur.execute("INSERT INTO prueba (nombre,edad) VALUES('adriana',40)")

    conexion.commit() # <- We MUST commit to reflect the inserted data
    return {"step": "insertar"}


@app.route("/carga")
def carga():
    print("inicio conexion")
    file = "/home/rau/datos.csv"
    f = open(file)
    cur.copy_from(f,'prueba', sep=";")
    conexion.commit() # <- We MUST commit to reflect the inserted data
    return {"step": "insertar"}
