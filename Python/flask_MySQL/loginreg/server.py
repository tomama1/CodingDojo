from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
import re
import hashlib

PASSWORD_REGEX = re.compile(r'^\d.*[A-Z]|[A-Z].*\d')
app = Flask(__name__)
app.secret_key = ("CodingDojo")
mysql = MySQLConnector(app,'loginreg')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    login_email = request.form['login_email']
    login_password = hashlib.md5(request.form['login_password'])
    login_password = login_password.hexdigest()
    dbpass = mysql.query_db("SELECT password FROM users WHERE email = :email",{'email': login_email})
    print login_password, dbpass[0]['password']
    if login_password == dbpass[0]['password']:
        return redirect('/dashboard')
    else:
        return redirect('/')

@app.route('/dashboard')
def home():
    return render_template('login.html')

@app.route('/logout')
def logout():
    return redirect('/')

@app.route('/process', methods=['POST'])
def register():
    x = True
    print x
    firstname = request.form['firstname']
    if len(firstname)<2:
        flash("Name must be longer than 2 characters!",'firstname')
        x = False


    lastname = request.form['lastname']
    if len(lastname)<2:
        flash("Last name must be longer than 2 characters!", 'lastname')
        x = False


    email = request.form['email']
    if len(email)==0:
        flash("Please input an email!", 'email')
        x = False


    password = request.form['password']
    if len(password)==0:
        flash("Please input a password!", 'password') 
        x = False
        # return redirect('/')

    if not PASSWORD_REGEX.match(password):
        flash("Your password must have one Uppercase letter and a number", 'password')
        x = False

    pwconf = request.form['pwconf']
    if len(pwconf)==0:
        flash("Please re-enter your password!", 'pwconf')
        x = False

    if (pwconf!=password):
        flash("Your passwords do not match!", 'pwconf')
        x = False
    print x
    if x == True:
        hash_object = hashlib.md5(request.form['password'])
        query = "INSERT INTO users (first_name, last_name, email, password, created_at, updated_at) VALUES (:firstname, :lastname, :email, :hashpassword, NOW(), NOW())"
        data = {
                'firstname' : request.form['firstname'],
                'lastname' : request.form['lastname'],
                'email': request.form['email'],
                'hashpassword': hash_object.hexdigest()
                }
        mysql.query_db(query, data)
        return redirect('/dashboard')
    return redirect('/')
app.run(debug=True)