# requirement analysis

I want to build a web application that can be used students to take notes, store files and set reminds for revision.
A web application will is convinient for students as it could be used on almost any device, backing up student work could be handled on the server which would take cognitive load off from students. A few drawbacks that I can think of at the moment are the that an internet connection would be required for students to access their data, privacy and security issues concerning user data.

## functionality requirement checklist
- [ ] Note functionality
    - [ ] Create note
    - [ ] Load note
    - [ ] Update (save) note
    - [ ] Delete note
    - [ ] Search notes
- [ ] File upload functionality
    - [ ] Upload file
    - [ ] Delete file
    - [ ] Update file
    - [ ] Search files
- [ ] User account functionality
    - [ ] Create account
    - [ ] \(Optional) Delete account
    - [ ] Login
    - [ ] Log out
- [ ] Reminder functionality
    - [ ] set reminder manually
    - [ ] view upcoming reminders
    - [ ] view past reminders
    - [ ] search reminders
    - [ ] send email as a reminder to users.
- [ ] Over-lapping functionality
    - [ ] attach file to note
    - [ ] have an option with sane defaults to create a note with a reminder
    - [ ] attach file to a reminder.  
    - [ ] \(Optional) performance metrics
    - [ ] \(Optional) PWA for push notifications

## non functional requirement checklist

- [] responsive UI
- [] fast load times
- [] secure data storage
- [] privacy (users can only access their notes) 

## constraints

Since the artefact is a prototype, I will be using a simpler database and self hosting the project on my server. This will ultimately affect the number of concurrent users the prototype would be able to handle as a single machine will be limited by network speed, cpu speed and storage speed. Another constraint is time, at the moment of writing this, I have 2 weeks left till the submission date, I simply do not have time to learn new tools, so I will be using tools I have already used. I rent a linux virtual private server (vps) that I can host this project on. I have experience using Python, Flask, HTMX and Sqlite3 to write dynamic web applications. Due to the time constraints to learn new skills, I have labelled a few functionality requirements as optional.

## feasibility

A web app with CRUD functionality is nothing new and not complicated. I should be able to do the whole app in a few days to implement the core functionality. I will have to learn how to set up my own email server to send reminders to users and how to integrate it with my python application.