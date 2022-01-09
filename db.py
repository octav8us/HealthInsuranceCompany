from mysql.connector import connect, Error


def send_query(sqlquery):
    myhost = 'localhost'
    mydatabase = 'Health_insurance_company'
    myuser = 'root'
    mypass = 'password'

    con = connect(host=myhost,
                  database=mydatabase,
                  user=myuser,
                  password=mypass)

    cur = con.cursor()

    try:
        cur.execute(sqlquery)
    except Error as e:
        print("Eception", e)


    records = cur.fetchall()
    con.commit()
    con.close()
    return records


def add_query(sqlquery):
    myhost = 'localhost'
    mydatabase = 'Health_insurance_company'
    myuser = 'root'
    mypass = 'password'

    con = connect(host=myhost,
                  database=mydatabase,
                  user=myuser,
                  password=mypass)

    cur = con.cursor()

    try:
        cur.execute(sqlquery)
    except Error as e:
        print("Eception", e)

    records = "sucess"
    con.commit()
    con.close()
    return records
