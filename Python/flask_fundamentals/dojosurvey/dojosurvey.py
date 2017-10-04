from flask import Flask, redirect, render_template, request

app = Flask(__name__)

@app.route('/')
def show_index():
    return render_template('index.html')

@app.route('/results',methods=['POST'])
def show_results():
    print request.form['name']
    name1 = request.form['name']
    location1 = request.form['location']
    language1 = request.form['language']
    comment1 = request.form['comment']
    return render_template('result.html',name=name1,location=location1,language=language1,comment=comment1)

app.run(debug=True)

