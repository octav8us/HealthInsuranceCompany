from flask import Flask, render_template, request, redirect, url_for
import db , API.api

app = Flask(__name__)

records = db.send_query('select Name from Enrolled_Hospitals ;')
plans_data = db.send_query('select * from plans ; ')
claims = db.send_query('select * from Insurance_claims ;')
hospitals = db.send_query('select * from Enrolled_Hospitals ;')
costumers = db.send_query('select * from customers ;')


def costumer_claim(ssn):
    id = db.send_query(f'select Claim_ID from files WHERE SSN={ssn};')
    return db.send_query(f'select * from Insurance_claims where Claim_ID = {id}')




@app.route('/',methods=['GET', 'POST'])
def hello_world():
    return render_template('home.html')

@app.route('/resolve',methods=['GET', 'POST'])
def hello_world():
    id =request.form.get('claim')
    db.send_query(f'update Insurance_claims set Resolved=1 where Claim_ID = {id} ')
    return render_template('home.html')

@app.route('/sign_in')
def sign_in():  # put application's code here
    return render_template('sign_in.html')


@app.route('/hospitals')
def hospital():  # put application's code here
    return render_template('hospitals.html', data=hospitals)

@app.route('/claims')
def claims():  # put application's code here
    return render_template('claims.html', data=claims)

@app.route('/clients')
def clients():  # put application's code here
    return render_template('clients.html', data=costumers)

@app.route('/data_display', methods=['GET', 'POST'])
def data_display():  # put application's code here
    return render_template('admin_view.html', data=records)

@app.route('/plans', methods=['GET', 'POST'])
def plans():
    ssn = request.form.get('ssn')
    if ssn == 'admin':
        return render_template('admin_view.html')

    return render_template('claims.html', data=costumer_claim(ssn))


@app.route('/newcus', methods=['GET', 'POST'])
def newcus():
    first_name = request.form.get('first_name')
    middle_name = request.form.get('middle_name')
    last_name = request.form.get('last_name')
    city = request.form.get('city')
    zip = request.form.get('zip')
    state = request.form.get('state')
    street_name = request.form.get('street_name')
    street_number = request.form.get('street_number')
    Apartment_number = request.form.get('apartment_number')
    gender = request.form.get('gender')
    Birth_date = request.form.get('birth_date')
    SSN = request.form.get('ssn')
    Job = request.form.get('job')
    Email = request.form.get('email')
    Phone_number = request.form.get('Phone_number')
    home_number = request.form.get('home_number')
    plans = request.form.get('plans')


    API.api.add_customer(first_name,middle_name,last_name,home_number,city,zip,state,street_name,street_number,Apartment_number,gender,Birth_date,SSN,Job,Email,Phone_number,plans)

    return render_template('newcus.html', data=plans_data)


@app.route('/congratulations', methods=['GET', 'POST'])

def cong():
        first_name = request.form.get('first_name')
        middle_name = request.form.get('middle_name')
        last_name = request.form.get('last_name')
        relationship = request.form.get('relationship')
        ssn = request.form.get('ssn')
        birth_date = request.form.get('birth_date')
        cus_ssn = request.form.get('cus_ssn')
        API.api.add_depndant(first_name,middle_name,last_name,relationship,ssn,birth_date,cus_ssn)
        return render_template('congratulations.html')


def congratulations():
    plan = request.args.get('plan')

@app.route('/Register', methods=['GET', 'POST'])
def register():
    plan = request.args.get('plan')

    if plan:
        return render_template('register.html', plan=plan)
    else:
        return render_template('register.html', plan='Basic')


if __name__ == '__main__':
    app.run(debug=True)
