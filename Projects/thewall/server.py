from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
import re
import hashlib

PASSWORD_REGEX = re.compile(r'^\d.*[A-Z]|[A-Z].*\d')
app = Flask(__name__)
app.secret_key = ("CodingDojo")
mysql = MySQLConnector(app,'thewall')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    login_email = request.form['login_email']
    login_password = hashlib.md5(request.form['login_password'])
    login_password = login_password.hexdigest()
    dbpass = mysql.query_db("SELECT password FROM users WHERE email = :email",{'email': login_email})
    if login_password == dbpass[0]['password']:
        user_id = mysql.query_db("SELECT id, first_name, last_name FROM users WHERE email = :email",{'email': login_email})
        session['user_id'] = user_id[0]['id']
        session['first_name'] = user_id[0]['first_name']
        session['last_name'] = user_id[0]['last_name']
        return redirect('/wall')
    else:
        return redirect('/')

@app.route('/logout')
def logout():
    session['user_id'] = ""
    return redirect('/')

@app.route('/process', methods=['POST'])
def register():
    x = True
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
        user_id = mysql.query_db("SELECT id FROM users WHERE email = :email",{'email': request.form['email']})
        session['user_id'] = user_id[0]['id']
        return redirect('/wall')
    return redirect('/')

@app.route('/wall')
def wall():
    messages = mysql.query_db("SELECT messages.id, messages.user_id, users.first_name, users.last_name, message, messages.created_at FROM messages JOIN users ON users.id = messages.user_id ORDER BY messages.created_at ASC")
    comments = mysql.query_db("SELECT comments.id, comment, users.first_name, users.last_name, comments.created_at FROM comments JOIN messages ON messages.id = comments.message_id JOIN users ON users.id = comments.user_id ORDER BY comments.created_at ASC")
    return render_template('wall.html', all_messages = messages, all_comments = comments)

@app.route('/postmsg', methods=["POST"])
def postmsg():
    query = "INSERT INTO messages (user_id, message, created_at, updated_at) VALUES (:user_id, :message, NOW(), NOW())"
    data = {
            'user_id' : session['user_id'],
            'message' : request.form['msg']
            }
    mysql.query_db(query, data)
    return redirect('/wall')

@app.route('/postcmt', methods=["POST"])
def postcmt():
    query = "INSERT INTO comments (message_id, user_id, comment, created_at, updated_at) VALUES (:message_id, :user_id, :comment, NOW(), NOW())"
    data = {
            'message_id' : request.form['hiddenmsgid'],
            'user_id' : session['user_id'],
            'comment' : request.form['cmt']
            }
    mysql.query_db(query, data)
    return redirect('/wall')

@app.route('/remove', methods=["POST"])
def removemsg():
    query = "DELETE FROM messages WHERE id = :message_id"
    data = {'message_id' : request.form['cancel']}
    mysql.query_db(query, data)
    query2 = "DELETE FROM comments WHERE message_id = :message_id"
    data2 = {'message_id' : request.form['cancel']}
    mysql.query_db(query2, data2)
    return redirect('/wall')
app.run(debug=True)