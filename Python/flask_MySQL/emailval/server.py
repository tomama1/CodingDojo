from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
import re
app = Flask(__name__)
app.secret_key = ("CodingDojo")
mysql = MySQLConnector(app,'listserv')

@app.route('/')
def index():
    if session.get('emailval') == None:
        session['emailval'] = True
    emails = mysql.query_db("SELECT * FROM listserv")
    return render_template('index.html', all_emails = emails)

# @app.route('/friends/<friend_id>')
# def show(friend_id):
#     # Write query to select specific user by id. At every point where
#     # we want to insert data, we write ":" and variable name.
#     query = "SELECT * FROM friends WHERE id = :specific_id"
#     # Then define a dictionary with key that matches :variable_name in query.
#     data = {'specific_id': friend_id}
#     # Run query with inserted data.
#     friends = mysql.query_db(query, data)
#     # Friends should be a list with a single object,
#     # so we pass the value at [0] to our template under alias one_friend.
#     return render_template('index.html', one_friend=friends[0])

@app.route('/process', methods=['POST'])
def create():
    email = request.form['email']
    if re.match(r"[^@]+@[^@]+\.[^@]+",email):
        query = "INSERT INTO listserv (email, created_at, updated_at) VALUES (:email, NOW(), NOW())"
        data = {
                'email': request.form['email']
            }
        mysql.query_db(query, data)
        session['emailval'] = True
    else:
        session['emailval'] = False
    return redirect('/')
app.run(debug=True)