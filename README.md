# Menu-Masters
General Assembly Build Your Own App Project


# About
Menu Masters is here to assist with the indecision in your life. Do you ever find yourself at home not knowing what to cook? Fear no longer! With Menu Masters smart recipe search system, simply enter the ingredients you have lying around and we will provide you a list of possible recipes.

## Technologies Used
### Languages
- Python
- Html
- CSS
- SQL

### Approach
Menu Masters is a Python Flask Application
### Key features
- app.py stores all the website functionality and edamam.py is used for the api request
- Templates folder contains all the pages of the website
    - Each html template uses Jinja to extend the base.html content and styles
- All CSS is managed through the styles.css document in the static folder
- Schema.sql has the initial database set-up and initialisation used within this application


## Installation Instructions (locally)
- Download the repo
- In your terminal create a virtual environment using [these](https://gist.github.com/frfahim/73c0fad6350332cef7a653bcd762f08d) instructions
- Install requirements with this code: ``` pip install -r requirements ```
- Set up SQL database and library by
    - Install postrges and build dependency: ``` sudo apt-get install -y postgresql libpq-dev ```
    - Create a user in postgres with name of current system user (might need to run the next line below if doesn’t work) ``` sudo -u postgres createuser "$(whoami)" -s ```
    - Start postgres server ``` sudo service postgresql start ```
    - Get into PSQL ``` psql # OR IF THAT DOESN'T WORK postgres psql ```
- Drop all the data from schema.sql into the terminal to create the data bases
- In your virtual environment run ``` python app.py ``` to boot up the application



### Join in the fun
Come try it out [now](https://rocky-shelf-41575.herokuapp.com/)!