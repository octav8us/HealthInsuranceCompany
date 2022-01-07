from flask import Flask, render_template, request, redirect, url_for
from db import db

app = Flask(__name__)

records = db('select Name from Enrolled_Hospitals ;')
plans_data = db('select * from plans ; ')


@app.route('/')
def hello_world():  # put application's code here
    return render_template('home.html', data=records)


@app.route('/hospital')
def hospital():  # put application's code here
    return render_template('home.html', data=records)


@app.route('/plans')
def plans():

    return render_template('plans.html', data=plans_data)


@app.route('/Register', methods = ['GET', 'POST'])
def register():
    if request.method == "GET":
        plan = request.form.get('plan')
        return render_template('register.html', plan = plan)
    else:
         return render_template('register.html', plan = 'basic')



if __name__ == '__main__':
    app.run(debug=True)
