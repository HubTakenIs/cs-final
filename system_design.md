# System Design

I will breakdown the architecture chosen, frontend / backend separation, database design and UI mockups. I will create different diagrams for each part of the system and include a screenshot in this file. 

## Artefact Architecture

![artefact architecture](/system_design/artefact%20architecture.png)

The diagram above shows system components and and how they interact. Web browser (user) would request the landing page from the server. On the landing page, the user would be directed towards the login / registration page. The flask backend application would authenticate a user who is trying to login or when they are tryign to make a request to the server. Flask backend will use the database and disk to store incoming data from the user and it will use the scheduler to schedule email reminders to be sent later. 



## Artefact Structure

```
# this repository
|-- pyproject.toml
|-- LICENSE

# artefact folder
/note_app/
|-- __init__.py # initialise flask app object
|-- config.py # configure flask
|-- db.py # database connection helper
|-- schema.sql # database schema
|-- /static / # static files
    | -- style.css
    | -- app.js
|-- /templates / # jinja2 UI templates
|-- /tests / # unit and integration tests
|-- /instance / # local instance
    |-- /uploads/ # upload folder
        |-- /user_id/ # folder for each user, to store their uplaodes
    |-- db.sqlite3 # the database

```