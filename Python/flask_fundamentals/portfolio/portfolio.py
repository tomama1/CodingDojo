from flask import Flask, render_template 
                                         
app = Flask(__name__)                    
                                         
@app.route('/')
def hello_world():
    return render_template('index.html')   


@app.route('/portfolio')            
def display_portfolio():
    return render_template('portfolio.html')

@app.route('/about')
def display_about():
    return render_template('about.html')

app.run(debug=True)        