from flask import Flask
import psycopg2

app = Flask(__name__)

conexion = psycopg2.connect(host="localhost", database="blockbuster", user="postgres", password="raul13202")
cur = conexion.cursor()


@app.route("/")
def hello_world():
    print("inicio conexion")
    
    cur.execute( "SELECT * FROM prueba_incremento" )
    for id_fas ,nombre_fefa, edad_fjasdfa  in cur.fetchall() :
        print(id_fas,nombre_fefa, edad_fjasdfa)

    return {"step": "mostrar"}

@app.route("/insertar")
def insertar():
    print("inicio conexion")
    
    cur.execute("INSERT INTO prueba_incremento (nombre,edad) VALUES('adriana',40)")

    conexion.commit() # <- We MUST commit to reflect the inserted data
    return {"step": "insertar"}

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


@app.route("/cargarModelo")
def cargarModelo():
    print("inicio conexion")
    
    with cur as cursor:
        cursor.execute(open("./base.sql", "r").read())
        conexion.commit() # <- We MUST commit to reflect the inserted data

    return {"step": "cargarModelo"}