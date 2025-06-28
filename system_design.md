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
|-- .gitignore
|-- /.venv
|-- /tests / # unit and integration tests
|-- /instance / # local instance. this won't be commited to git
    |-- /uploads/ # upload folder
        |-- /user_id/ # folder for each user, to store their uploads
    |-- db.sqlite3 # the database

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

```

The proposed artefact structure will contain a project file `pyproject.toml` to build the project for deployment. `note_app` directory will contain all of the code as one module for the notetaking app. `.venv` directory will not be commited to source control and it will contain a virtual environment as per python dependancy management best practices. `tests` directory will hold test data, unit tests and integrations tests for the whole application. `.gitignore` file will contain recreateable files that do not need to be commited to source control.

## UI navigation diagrams
![UI navigation](/system_design/UI_nagivation.png)

## UI mockups / ideas

### Landing Page
![Landing page design ](/system_design/landing_page_design.png)
### Login / Register Page
![Login and registration page design](/system_design/login_page_design.png)
### User Dashboard
![User dashboard page design](/system_design/user_dashboard_design.png)
### Single Item View
![Single Item view page design](/system_design/single_item_view_design.png)
### Item List View
![Item list view page design](/system_design/item_list_view_design.png)

## Database Design
![ERD](/system_design/ERD.png)