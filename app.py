from flask import Flask, request, render_template, redirect, session
import psycopg2
import os
import bcrypt
import edamam

import requests

DATABASE_URL = os.environ.get('DATABSAE_URL', 'dbname=menu_masters')
SECRET_KEY = os.environ.get('SECRET_KEY', 'pretend secret key for testing')

app = Flask(__name__)
app.config['SECRET_KEY'] = SECRET_KEY


@app.route('/')
def login():
  return render_template('login.html')


@app.route('/',  methods=['POST'])
def login_action():
    email = request.form.get('email')
    password = request.form.get('password')
    conn = psycopg2.connect('dbname=menu_masters')
    cur = conn.cursor()
    cur.execute('SELECT users_id, email, name FROM users WHERE email = %s', [email])
    results = cur.fetchone()
    # email_match = results[1]
    print(results)
    conn.close()

    if results == None:
        return redirect('/')

    else:
        session['email'] = email
        return redirect('/home')

@app.route('/home')
def index():
    return render_template('home.html')

@app.route('/recipe', methods=["GET"])
def movie():
    search = request.args.get("search")
    recipe_details = edamam.get_recipes(search)
    recipe_name = recipe_details.get('label')
    ran_var = recipe_details.get('hits')
    return render_template('recipes.html', title=recipe_name, details=recipe_details, ran_var=ran_var)

if __name__ == "__main__":
    app.run(debug=True)