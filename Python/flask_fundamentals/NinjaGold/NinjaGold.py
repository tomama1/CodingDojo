from flask import Flask, render_template, redirect, request, session
import random
import time
app = Flask(__name__)
app.secret_key=("CodingDojo")



@app.route('/')
def index():
    return render_template('index.html')

@app.route('/process', methods=["POST"])
def process():
    if session.get('activities')== None:
        session['activities'] = []
    if session.get('gold')==None:
        session['gold'] = 0

    if request.form['building']=='farm':
        num = random.randrange(10,21)
        session['gold']+= num
        currentlist = session['activities']
        currentlist.append(str(time.strftime("%H:%M:%S"))+" Earned {} golds from the farm!".format(num))
        session['activities'] = currentlist

    elif request.form['building']=='cave':
        num = random.randrange(5,11)
        session['gold']+= num
        currentlist = session['activities']
        currentlist.append(str(time.strftime("%H:%M:%S"))+" Earned {} golds from the cave!".format(num))
        session['activities'] = currentlist

    elif request.form['building']=='house':
        num = random.randrange(2,6)
        session['gold']+= num
        currentlist = session['activities']
        currentlist.append(str(time.strftime("%H:%M:%S"))+" Earned {} golds from the house!".format(num))
        session['activities'] = currentlist

    elif request.form['building']=='casino':
        num = random.randrange(0,51)
        num2 = random.randrange(0,2)
        if num2 == 0:
            session['gold'] += num
            currentlist = session['activities']
            currentlist.append(str(time.strftime("%H:%M:%S"))+" Entered a casino and won {} golds!".format(num))
            session['activities'] = currentlist
        else:
            session['gold'] -= num
            currentlist = session['activities']
            currentlist.append(str(time.strftime("%H:%M:%S"))+" Entered a casino and lost {} golds ... Ouch..".format(num))
            session['activities'] = currentlist

    return redirect('/')

@app.route('/reset')
def reset():
    session.clear()
    return redirect('/')


app.run(debug=True)