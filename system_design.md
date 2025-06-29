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

## App Endpoint Design

|HTTP Method | Endpoint | Description | Request Body | Response |
| ---------- | -------- | ----------- | ------------ | -------- | 
|   `GET`  | `/notes`| Fetch all notes for a user | blank | List of Notes| 
|   `GET`  | `/notes/<id>`| Fetch single note by ID | blank | Note object representation| 
|   `POST`  | `/notes/`| create new note | Title, content | redirect to new note| 
|   `PUT`  | `/notes/<id>`| update a note | fields to update | redirect to updated note| 
|   `DELETE`  | `/notes/<id>`| delete a note | blank | redirect to list of notes| 
|   `GET`  | `/uploads`| fetch all uploads for a user | blank | list of user's uploads|
|   `GET`  | `/uploads/<id>`| fetch an upload by ID | blank | single upload details |
|   `POST`  | `/uploads`| create upload record and save file | file | redirect to upload details.|
|   `DELETE`  | `/uploads/<id>`| delete upload | blank | redirect to user's uploads| 
|   `GET`  | `/reminders`| fetch all reminders for a user | blank | list of user's reminders|
|   `GET`  | `/reminders/<id>`| fetch a reminder by ID | blank | single reminder details |
|   `POST`  | `/reminders`| create reminder record and save file | title, task, email_sent, review_date | redirect to reminder details.|
|   `DELETE`  | `/reminders/<id>`| delete reminder | blank | redirect to user's reminders|
|   `POST`  | `/reminders/<id>/attach`| attach reminder to note | note id | redirect to note|
|   `POST`  | `/uploads/<id>/attach`| attach upload to note | note id  | redirect to user's note|
|   `POST`  | `/reminders/<id>/deattach`| de-attach reminder from note | note id | redirect to note|
|   `POST`  | `/uploads/<id>/deattach`| de-attach upload from note | note id  | redirect to user's note|

## Security Considerations

### Authentication
- Session management: use secure, signed session tokens that are validated by the server. 

### Password and User Credential Safety
- Store passwords using strong hashing algorithms
- Use email verification on signup 

### Input Validation and Sanitization
Sanitize inputs for all endpoints to prevent injection attacks (SQL injection, XSS, etc.).
Implement server-side validation for all data including:
- Note titles/content
- reminder titles/descriptions
- Uploaded file metadata
- User inputs (IDs, emails, dates)

### File upload security
- Only allow specific file types (.pdf, .docx, .txt, .png, .jpeg) by checking file extension.
- Limit file size (e.g., 10MB max) to save space, reduce load times and prevent a DoS.
- Store uploaded files outside the public web directory

### Data Privacy
- use HTTPS for all communication
- Ensure users can only access their own notes, files, and schedules.