from flask import Flask, request, redirect, render_template, flash
from mysqlconnection import MySQLConnector
import re
app = Flask(__name__)
app.secret_key = ("CodingDojo")
mysql = MySQLConnector(app,'listserv')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/process', methods=['POST'])
def create():
    # grabbing user input from form
    email = request.form['emailcheck']
    # query for checking the database
    query = "SELECT email from listserv WHERE email = :echeck"
    data = {
        'echeck':email
    }
    emailcheck = mysql.query_db(query, data)
    # if email exists in database
    if emailcheck:
        flash("Valid Email")
        return redirect('/success')
    else:
        # regex check for valid email string
        if re.match(r"[^@]+@[^@]+\.[^@]+",email):
            # insert query into database
            query = "INSERT INTO listserv (email, created_at, updated_at) VALUES (:emailtobeinserted, NOW(), NOW())"
            # mysql.query_db("INSERT INTO listserv(email, created_at, updated_at) VALUES (:emailtobeinserted, NOW(), NOW())",{'emailtobeinserted':email})"
            data = {
                    'emailtobeinserted': request.form['emailcheck']
                }
            mysql.query_db(query, data)
            flash("Email has been Inserted!")
        else:
        # not a valid email string ( no @ sign)
            flash("Not a valid email")
    return redirect('/')
    
@app.route('/success')
def success():
    # display all rows in the listserv table
    emails = mysql.query_db("SELECT * FROM listserv")
    return render_template('success.html', all_emails = emails)


@app.route('/goback')
def goback():
    return redirect('/')
app.run(debug=True)