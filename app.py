from flask import Flask, request, render_template, redirect, session
import psycopg2
import os
import bcrypt
import edamam

import requests

DATABASE_URL = os.environ.get('DATABASE_URL', 'dbname=menu_masters')
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
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()
    cur.execute('SELECT users_id, email, name, password FROM users WHERE email = %s', [email])
    results = cur.fetchall()
    password_hashed = results[0][3]
    valid = bcrypt.checkpw(password.encode(), password_hashed.encode())
    print(valid)
    print(password_hashed)
    # email_match = results[1]
    print(results)
    user_id = results[0][0]
    print(user_id)
    # password_hash = results[4]
    # print(password_hash)
    conn.close()

    if valid:
        session['email'] = email
        session['user_id'] = user_id
        return redirect('/home')
    else:
        return redirect('/')

@app.route('/home')
def index():
    return render_template('home.html')

@app.route('/recipe', methods=["GET"])
def recipe_search():
    search = request.args.get("search")
    print(search)
    session['search'] = search
    recipe_details = edamam.get_recipes(search)
    recipe_name = recipe_details.get('label')
    ran_var = recipe_details.get('hits')
    return render_template('recipes.html', title=recipe_name, details=recipe_details, ran_var=ran_var, search=search)

@app.route('/recipe', methods=['POST'])
def save_recipe():
    url = request.form.get("url")
    image = request.form.get("image")
    name = request.form.get("title")
    search_term = request.form.get("searchterm")
    user_id = session.get('user_id')
    print(url)
    print(image)
    print(name)
    print(user_id)
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()
    cur.execute('INSERT INTO saves (users_id, name, url, image) VALUES (%s, %s, %s, %s)', [user_id, name, url, image])
    conn.commit()
    conn.close()
    return redirect(f'/recipe?search={search_term}')

@app.route('/saves')
def saves():
    user_id = session.get('user_id')
    # Select statement here to fetch all results when user id = session
    # Use same logic as recipe
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()
    cur.execute('SELECT name, url, image FROM saves WHERE users_id = %s', [user_id])
    results = cur.fetchall()
    return render_template('saves.html', results=results)

@app.route('/remove', methods=['POST'])
def remove():
    name = request.form.get("title")
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()
    cur.execute('DELETE FROM saves WHERE name = %s', [name])
    conn.commit()
    conn.close()
    return redirect('/saves')

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')


if __name__ == "__main__":
    app.run(debug=True)