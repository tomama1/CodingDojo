from flask import Flask, render_template, session, redirect, request
import random

app = Flask(__name__)

app.secret_key = 'CodingDojo'

@app.route('/')
def index():
    if session.get('result') == None:
        session['result'] = ''
    if session.get('cpu_num') == None:
        randnum = random.randrange(0,101)
        session['cpu_num'] = randnum
    if session.get('player_guess')==None:
        session['player_guess'] = 0
    print session['player_guess']
    return render_template('index.html')

@app.route('/guess',methods=['POST'])
def guesscheck():
    session['player_guess'] = int(request.form['guess'])
    if session['player_guess']==session['cpu_num']:
        session['result'] = 'You guessed it correct!'
    elif session['player_guess']>session['cpu_num']:
        session['result'] = 'Too high. Try Again!'
    else:
        session['result'] = 'Too low. Try Again!'
    return redirect('/')

@app.route('/reset')
def reset():
    session.clear()
    return redirect('/')

app.run(debug=True)
