import psycopg2

db_conn = """
    host='tuffi.db.elephantsql.com'
    dbname= 'sjogjhsq'
    user='sjogjhsq'
    password='senha'
"""

def execute_query(query):
    conn = psycopg2.connect(db_conn)
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close

def insert_account(account):
    query = f"INSERT INTO accounts (name, email, cpf) VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}');"
    execute_query(query)

def delete_account_by_email(email):
    query = f"DELETE FROM accounts WHERE email = '{email}'; "
    execute_query(query)