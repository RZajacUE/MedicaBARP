import mysql.connector
from flask import Flask, render_template, request, redirect, url_for
import re

mydb = mysql.connector.connect(
    host = "localhost", 
    user = "root", 
    passwd = "", 
    database = "przychodnia_test")

query = "SELECT * from pacjenci"
query2 = "SELECT * from lekarze"
query3 = "SELECT * from pokoje"
query4 = "SELECT * from karty_pacjentow"

cursor = mydb.cursor()
cursor.execute(query)

print('\nPacjenci')
for x in cursor:
    for y in x:
        print(y, end=' ')
    print()

cursor.execute(query2)

print('\nLekarze')
for x in cursor:
    for y in x:
        print(y, end=' ')
    print()

cursor.execute(query3)

print('\nPokoje')
for x in cursor:
    for y in x:
        print(y, end=' ')
    print()
print()

cursor.execute(query4)

print('\nKarty_pacjentów')
for x in cursor:
    for y in x:
        print(y, end=' ')
    print()

app = Flask(__name__)

@app.route("/register", methods = ["GET", "POST"])
def register():
    if request.method == "POST":
        name = request.form.get("name")
        surname = request.form.get("surname")
        pesel = request.form.get("pesel")
        password = request.form.get("password")
        r_password = request.form.get("repeat_password")
        RODO = request.form.get("check")
        pattern = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        pattern2 = "/\d{11,11}/gm"

        print(f'{name} {surname} {pesel} {password} {r_password} {RODO}')

        insert = f"INSERT into pacjenci (IdPacjenta, Imie, Nazwisko, Pesel, Haslo) VALUES (null, '{name.capitalize()}', '{surname.capitalize()}', '{pesel}', '{password}')"
        print(insert)
        
        password_strength = re.match(pattern, password)
        pesel_digits = re.match(pattern2, pesel)

        if pesel_digits == None:
            myresult4 = "Nieprawidłowy numer PESEL"
            return render_template('rejestracja_konta.html', myresult4 = myresult4)
        elif password_strength == None:
            myresult3 = "Hasło nie spełnia wymagań"
            return render_template('rejestracja_konta.html', myresult3 = myresult3)
        elif password != r_password:
            myresult = "Podane hasła różnią się!"
            return render_template('rejestracja_konta.html', myresult = myresult)
        elif RODO != 'on':
            myresult2 = "Akceptacja RODO jest wymagana!"
            return render_template('rejestracja_konta.html', myresult2 = myresult2)
        else:
            cursor.execute(insert)
            mydb.commit()
            return redirect(url_for('login'))
        
    return render_template('rejestracja_konta.html')

@app.route("/login", methods = ["GET", "POST"])
def login():
    if request.method == "POST":
        pesel = request.form.get("pesel")
        password = request.form.get("password")
        remember_me = request.form.get("check")
        print(f'{pesel} {password} {remember_me}')

        query5 = "SELECT pesel from pacjenci"
        query6 = f"SELECT Haslo from pacjenci where pesel = '{pesel}'"
        cursor.execute(query5)
        result = cursor.fetchall()
        cursor.execute(query6)
        result1 = cursor.fetchall()

        for i in result:
            for j in i:
                if j == pesel:
                    for passes in result1:
                        for p in passes:
                            if p != password:
                                print(p)
                                myresult1 = "Hasło jest nieprawidłowe"
                                return render_template('logowanie.html', myresult1 = myresult1)
                    return redirect(url_for('main'))
                else:
                    print(j)
                    continue
        myresult = "Użytkownik nie istnieje!"
        return render_template('logowanie.html', myresult = myresult)
        
    return render_template('logowanie.html')

@app.route("/", methods = ["GET", "POST"])
def main():
    return render_template('strona_glowna.html')

@app.route("/date", methods = ["GET", "POST"])
def date():
    pass