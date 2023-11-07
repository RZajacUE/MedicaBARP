import mysql.connector
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/", methods = ["GET", "POST"])
def register():
    # if request.method == "POST":
    #     name = request.form.get("name")
    #     surname = request.form.get("surname")
    #     email = request.form.get("email")
    #     print(f'{name} {surname} {email}')
        
    return render_template('polaczenie_test.html')

mydb = mysql.connector.connect(
    host = "localhost", 
    user = "root", 
    passwd = "", 
    database = "przychodnia")

query = "SELECT * from pacjenci"

cursor = mydb.cursor()
cursor.execute(query)

for x in cursor:
    print(x)