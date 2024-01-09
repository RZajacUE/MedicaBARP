import mysql.connector
from flask import Flask, render_template, request, redirect, url_for, session
import re
from colorama import Fore, Style, init as colorama_init
from datetime import datetime

mydb = mysql.connector.connect(
    host = "localhost", 
    user = "root", 
    passwd = "", 
    database = "przychodnia")

query = "SELECT * from pacjenci"
query2 = "SELECT * from lekarze"
query3 = "SELECT * from pokoje"
query5 = "SELECT * from wizyty"

cursor = mydb.cursor()
cursor.execute(query)

colorama_init()

print(f'\n{Fore.YELLOW}Pacjenci')
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

cursor.execute(query5)

print('\nWizyty')
for x in cursor:
    for y in x:
        print(y, end=' ')
    print()
print(f'{Style.RESET_ALL}')

app = Flask(__name__)
app.secret_key = 'secret'

@app.route("/register", methods = ["GET", "POST"])
def register():
    if request.method == "POST":
        name = request.form.get("name")
        surname = request.form.get("surname")
        sex = request.form.get("sex")
        pesel = request.form.get("pesel")
        birthdate =  request.form.get("birthdate")
        telephone = request.form.get("telephone")
        email = request.form.get("email")
        password = request.form.get("password")
        r_password = request.form.get("repeat_password")
        RODO = request.form.get("check")
        pattern = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        pattern2 = "\d{11}"
        pattern3 = ".+\@.+\..+|^0$"
        pattern4 = "\d{9}|^0$"

        print(f'\n{Fore.BLUE}{name} {surname} {sex} {pesel} {birthdate} {telephone} {email} {password} {r_password} {RODO}{Style.RESET_ALL}\n')
        if len(telephone) == 0:
            telephone = 0
        if len(email) == 0:
            email = 0

        insert = f"INSERT into pacjenci (IdPacjenta, Imie, Nazwisko, Pesel, DataUrodzenia, NumerTel, Haslo, Email, Plec) VALUES (null, '{name.capitalize()}', '{surname.capitalize()}', {pesel}, '{birthdate}', {telephone}, '{password}', '{email}', '{sex}')"
        print(f'{Fore.GREEN}{insert}{Style.RESET_ALL}')
        pesels = f"SELECT * from pacjenci where Pesel = {pesel}"
        if str(pesel):
            pesels = f"SELECT * from pacjenci where Pesel = '{pesel}'"
        cursor.execute(pesels)
        
        password_strength = re.match(pattern, password)
        pesel_digits = re.match(pattern2, str(pesel))
        correct_email = re.match(pattern3, str(email))
        phone_number_digits = re.match(pattern4, str(telephone))

        if pesel_digits == None:
            myresult4 = "Nieprawidłowy numer PESEL"
            print(f'{Fore.RED}{myresult4}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult4 = myresult4)
        elif cursor.fetchone():
            myresult5 = "Użytkownik o podanym numerze PESEL już istnieje!"
            print(f'{Fore.RED}{myresult5}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult5 = myresult5)
        elif phone_number_digits == None:
            myresult6 = "Podano niepoprawny format numeru telefonu"
            print(f'{Fore.RED}{myresult6}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult6 = myresult6)
        elif correct_email == None:
            myresult7 = "Podany adres E-mail jest nieprawidłowy"
            print(f'{Fore.RED}{myresult7}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult7 = myresult7)
        elif password_strength == None:
            myresult3 = "Hasło nie spełnia wymagań. Poprawne hasło powinno mieć minimalnie 8 znaków w tym: 1 duża litera, 1 mała litera, 1 cyfra, 1 znak specjalny"
            print(f'{Fore.RED}{myresult3}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult3 = myresult3)
        elif password != r_password:
            myresult = "Podane hasła różnią się!"
            print(f'{Fore.RED}{myresult}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult = myresult)
        elif RODO != 'on':
            myresult2 = "Akceptacja RODO jest wymagana!"
            print(f'{Fore.RED}{myresult2}{Style.RESET_ALL}\n')
            return render_template('rejestracja_konta.html', myresult2 = myresult2)
        else:
            cursor.execute(insert)

            if telephone == 0:
                update = f"UPDATE pacjenci SET NumerTel = NULL WHERE IdPacjenta = (SELECT max(IdPacjenta) from pacjenci)"
                cursor.execute(update)
            if email == 0:
                update1 = f"UPDATE pacjenci SET Email = NULL WHERE IdPacjenta = (SELECT max(IdPacjenta) from pacjenci)"
                cursor.execute(update1)

            mydb.commit()
            return redirect(url_for('login'))
        
    return render_template('rejestracja_konta.html')

@app.route("/login", methods = ["GET", "POST"])
def login():
    if request.method == "POST":
        pesel = request.form.get("pesel")
        password = request.form.get("password")
        remember_me = request.form.get("check")
        print(f'{Fore.BLUE}{pesel} {password} {remember_me}{Style.RESET_ALL}')

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
                                myresult1 = "Hasło jest nieprawidłowe"
                                print(f'{Fore.RED}{myresult1}{Style.RESET_ALL}')
                                return render_template('logowanie.html', myresult1 = myresult1)
                            
                            cursor.execute(f"SELECT * from pacjenci WHERE pesel = {pesel}")
                            user = cursor.fetchall()
                            if user:
                                session['user_id'] = user[0]
                                return redirect(url_for('dashboard'))
                else:
                    continue
        myresult = "Użytkownik nie istnieje!"
        print(f'{Fore.RED}{myresult}{Style.RESET_ALL}')
        return render_template('logowanie.html', myresult = myresult)
        
    return render_template('logowanie.html')

@app.route("/dashboard", methods = ["GET", "POST"])
def dashboard():

    if 'user_id' in session:
        user_id = session['user_id']
        cursor.execute("SELECT * FROM pacjenci where IdPacjenta = %s", (user_id[0],))
        user = cursor.fetchall()
        print(f'{Fore.BLUE}{user}{Style.RESET_ALL}')
        informacja = f'Witaj, {user[0][1]} {user[0][2]}'
        return render_template('dashboard.html', user = informacja)
    else:
        return redirect(url_for('main'))

@app.route("/", methods = ["GET", "POST"])
def main():

    return render_template('strona_glowna.html')

@app.route("/date", methods = ["GET", "POST"])
def date():

    cursor = mydb.cursor()
    if 'user_id' in session:
        user_id = session['user_id']
        cursor.execute("SELECT * FROM pacjenci where IdPacjenta = %s", (user_id[0],))
        user = cursor.fetchall()
        print(f'{Fore.BLUE}{user}{Style.RESET_ALL}')
    
    query = "SELECT IdLekarza, Imie, Nazwisko, Specjalizacja, NumerPokoju from lekarze join pokoje on lekarze.IdPokoju = pokoje.IdPokoju"
    cursor.execute(query)

    data = datetime.now()
    hours = []
    print(f'{Fore.BLUE}{data}{Style.RESET_ALL}')

    for i in range(8, 16):
        hours.append(f"{i}:00")

    if request.method == "POST":
        IDlekarza = request.form.get("IDlekarza")
        dzien = request.form.get("date")
        godziny = request.form.get("godziny")

        print(f'{Fore.BLUE}{IDlekarza} {dzien} {godziny}{Style.RESET_ALL}')

        if IDlekarza == None:
            myresult = "Nie wybrano lekarza!"
            print(f'{Fore.RED}{myresult}{Style.RESET_ALL}')
            return render_template('umawianie_terminu.html', myresult = myresult, wyniki = cursor.fetchall(), godziny = hours)
        elif bool(dzien) == False:
            myresult2 = "Nie wybrano dnia wizyty!"
            print(f'{Fore.RED}{myresult2}{Style.RESET_ALL}')
            return render_template('umawianie_terminu.html', myresult2 = myresult2, wyniki = cursor.fetchall(), godziny = hours)
        
        hour_divide = godziny.split(':')
        date_to_check = datetime(int(dzien[0:4]), int(dzien[5:7]), int(dzien[8:10]), int(hour_divide[0]), int(hour_divide[1]), 00)
        print(f'{Fore.BLUE}{date_to_check}{Style.RESET_ALL}')
        
        if date_to_check < data:
            myresult3 = "Wybrana data jest starsza od aktualnej!"
            print(f'{Fore.RED}{myresult3}{Style.RESET_ALL}')
            return render_template('umawianie_terminu.html', myresult3 = myresult3, wyniki = cursor.fetchall(), godziny = hours)

        q2 = f"SELECT DataWizyty from wizyty where IdLekarza = {IDlekarza}"
        cursor.nextset()
        cursor.execute(q2)
        wizyty = cursor.fetchall()
        for i in wizyty:
            for j in i:
                if j == date_to_check:
                    myresult4 = "Wybrany lekarz w tym terminie jest zajęty. Proszę o wybór innego lekarza lub daty."
                    print(f'{Fore.RED}{myresult4}{Style.RESET_ALL}')
                    cursor.execute(query)
                    return render_template('umawianie_terminu.html', myresult4 = myresult4, wyniki = cursor.fetchall(), godziny = hours)
        
        q = f"SELECT Imie, Nazwisko from lekarze where IdLekarza = {int(IDlekarza)}"
        print(f'{Fore.GREEN}{q}')
        cursor.execute(q)
        cursor.fetchall()
        for i in cursor:
            print(f'{i}{Style.RESET_ALL}')

        wizyta = f"INSERT into wizyty values (null, '{date_to_check}', {user[0][0]}, {IDlekarza})"
        print(f'{Fore.GREEN}{wizyta}{Style.RESET_ALL}')
        cursor.execute(wizyta)
        mydb.commit()
        return redirect(url_for('alldone'))

    return render_template('umawianie_terminu.html', wyniki = cursor.fetchall(), godziny = hours)

@app.route("/offer", methods = ["GET", "POST"])
def offer():

    if 'user_id' in session:
        user_id = session['user_id']
        cursor.execute("SELECT * FROM pacjenci where IdPacjenta = %s", (user_id[0],))
        user = cursor.fetchall()
        print(f'{Fore.BLUE}{user}{Style.RESET_ALL}')
        informacja = f'Witaj, {user[0][1]} {user[0][2]}'
        return render_template('oferta.html', user = informacja)
    else:
        return render_template('oferta.html')

@app.route("/doctor", methods = ["GET", "POST"])
def doctor():
    
    if 'user_id' in session:
        user_id = session['user_id']
        cursor.execute("SELECT * FROM pacjenci where IdPacjenta = %s", (user_id[0],))
        user = cursor.fetchall()
        print(f'{Fore.BLUE}{user}{Style.RESET_ALL}')
        informacja = f'Witaj, {user[0][1]} {user[0][2]}'
        return render_template('lekarze.html', user = informacja)
    else:
        return render_template('lekarze.html')

@app.route("/contact", methods = ["GET", "POST"])
def contact():
    
    if 'user_id' in session:
        user_id = session['user_id']
        cursor.execute("SELECT * FROM pacjenci where IdPacjenta = %s", (user_id[0],))
        user = cursor.fetchall()
        print(f'{Fore.BLUE}{user}{Style.RESET_ALL}')
        informacja = f'Witaj, {user[0][1]} {user[0][2]}'
        return render_template('kontakt.html', user = informacja)
    else:
        return render_template('kontakt.html')

@app.route("/alldone", methods = ["GET", "POST"])
def alldone():
    
    return render_template('udana_wizyta.html')

@app.route("/logout")
def logout():
    session.pop('user_id', None)
    return redirect(url_for('main'))