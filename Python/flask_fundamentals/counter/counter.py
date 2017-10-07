from flask import Flask, render_template, redirect, session

app = Flask(__name__)
app.secret_key = 'codingDojo'


@app.route('/')
def index():
    if session.get('count')!= None :
        session['count']+=1
    else:
        session['count'] = 0
    return render_template('index.html')

@app.route('/two')
def two():
    session['count']+=1
    return redirect('/')

@app.route('/reset')
def reset():
    session['count'] = -1
    return redirect('/')
app.run(debug=True)