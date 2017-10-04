from flask import Flask, render_template, request, redirect

app = Flask(__name__)
@app.route('/')
def show_index():
    return render_template('index.html')

@app.route('/process', methods=['POST'])
def submit_form():
    my_name = request.form['name']
    print my_name
    return redirect('/')

app.run(debug=True)