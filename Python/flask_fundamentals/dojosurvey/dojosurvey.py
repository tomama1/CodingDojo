from flask import Flask, redirect, render_template, request, flash, session
import re
app = Flask(__name__)

app.secret_key = ("CodingDojo")

@app.route('/')
def show_index():
    return render_template('index.html')

@app.route('/results',methods=['POST'])
def show_results():
    session['error'] = False;
    if len(request.form['name']) < 1:
        flash("Name cannot be blank!", 'category1')
        session['error']= True
    if len(request.form['comment']) < 120:
        flash("Comment not long enough!", 'category2')
        session['error'] = True
    if session['error'] == True:
        return redirect('/')
    else:
        name1 = request.form['name']
        location1 = request.form['location']
        language1 = request.form['language']
        comment1 = request.form['comment']
        return render_template('result.html',name=name1,location=location1,language=language1,comment=comment1)



app.run(debug=True)

