from flask import Flask, session, request, redirect, flash, render_template
import re

PASSWORD_REGEX = re.compile(r'^\d.*[A-Z]|[A-Z].*\d')
app = Flask(__name__)
app.secret_key = ("CodingDojo")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/validate', methods=["POST"])
def validate():
    firstname = request.form['firstname']
    if len(firstname)==0:
        flash("Please input a first name!",'firstname')
    else:
        for char in firstname:
            if type(char)== int:
                flash("Do not put numbers in your name", 'firstname')

    lastname = request.form['lastname']
    if len(lastname)==0:
        flash("Please input a last name!", 'lastname')
    else:
        for char in lastname:
            if type(char)== int:
                flash("Do not put numbers in your name", 'lastname')

    email = request.form['email']
    if len(email)==0:
        flash("Please input an email!", 'email')

    password = request.form['pw']
    if len(password)==0:
        flash("Please input a password!", 'password') 
    elif len(password)<8:
        flash("Your password must be at least 8 characters!", 'password')
    if not PASSWORD_REGEX.match(password):
        flash("Your password must have one Uppercase letter and a number", 'password')
    
    pwcon = request.form['pwc']
    if len(pwcon)==0:
        flash("Please re-enter your password!", 'pwcon')
    if (pwcon!=password):
        flash("Your passwords do not match!", 'pwcon')
    flash("Thanks for submitting your information.",'success')
    return redirect('/')

app.run(debug=True)