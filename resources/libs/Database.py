import psycopg2

def delete_account_by_email(email):

    query = f"DELETE FROM accounts WHERE email = '{email}'; "
    conn = psycopg2.connect(
        host='tuffi.db.elephantsql.com',
        database= 'sjogjhsq',
        user='sjogjhsq',
        password='senha'
    )

    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close