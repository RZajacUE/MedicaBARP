import mysql.connector
from flask import Flask, render_template, request, redirect, url_for

mydb = mysql.connector.connect(
    host = "localhost", 
    user = "root", 
    passwd = "", 
    database = "przychodnia_test")

query = "SELECT * from pacjenci"

cursor = mydb.cursor()
cursor.execute(query)

for x in cursor:
    print(x)

app = Flask(__name__)

@app.route("/register", methods = ["GET", "POST"])
def register():
    if request.method == "POST":
        name = request.form.get("name")
        surname = request.form.get("surname")
        pesel = request.form.get("pesel")
        password = request.form.get("password")
        r_password = request.form.get("repeat_password")
        print(f'{name} {surname} {pesel} {password} {r_password}')
        return redirect(url_for('login'))
        
    return render_template('rejestracja_konta.html')

@app.route("/login", methods = ["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        checkbox = request.form.get("check")
        print(f'{username} {password} {checkbox}')
        return redirect(url_for('main'))

    return render_template('logowanie.html')

@app.route("/", methods = ["GET", "POST"])
def main():
    return render_template('strona_glowna.html')

@app.route("/date", methods = ["GET", "POST"])
def date():
    pass