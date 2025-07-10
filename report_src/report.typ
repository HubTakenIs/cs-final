#set heading(numbering: "1.")

#outline()
#pagebreak()

= Introduction
== Project Motivation
Students in current educational environments are increasingly relying on digital resources, such as lecture recordings, online slides, and automatic note generators, which reduce the perceived necessity for traditional note-taking. Research indicates that passive involvement with study material, including rereading or duplicating knowledge, leads to lower long-term retention and understanding, even when these methods are convenient. It has been demonstrated that active learning strategies like spaced repetition and self-generated note-taking greatly enhance comprehension and memory consolidation. Nevertheless, a lot of current digital platforms put information delivery ahead of cognitive engagement, which results in a lack of use of these tried-and-true tactics.

The goal of this project is to close this gap by creating a tool that motivates students to take excellent, original notes and go over them at the best times. The method seeks to encourage active recall and sustained learning without overburdening the user by fusing note-taking with customised spaced repetition reminders. The research also recognises the motivating obstacles that students frequently encounter while trying to maintain regular study habits. The application offers a more comprehensive approach to digital learning support by addressing this issue with helpful features like motivational prompts and goal-oriented reminders. The ultimate objective is to develop a user-friendly, research-based application that enables students to learn more efficiently and on their own.
== Academic Questions
`Can a note taking app that implements spaced repetition help students study?`
== Research Topic Introduction
Two extensively researched cognitive methods that are important for academic learning and long-term memory retention are taking notes and spaced repetition. Actively documenting knowledge through note-taking can improve understanding and facilitate review at a later time. Based on psychology studies on memory consolidation, spaced repetition is the process of going over content at progressively longer intervals. In recent years, students' use of these tactics has changed due to digital learning settings and technologies, which has sparked a fresh interest among academics in their efficacy and technological optimization.

The usefulness of various note-taking techniques, such as digital versus handwritten and guided versus self-generated notes, and their effects on student learning are further investigated in the literature review. Additionally, it looks at the cognitive science underlying spaced repetition, emphasizing the advantages of active recall and the best review intervals. The review concludes by examining the function of digital note-taking and revision tools and assessing how they affect engagement, academic achievement, and self-control. These subjects offer a starting point for comprehending the educational ideas underlying the suggested note-taking program, which uses user-driven note creation and individualized review reminders to promote active learning and memory retention.
== Aims and Objectives
=== Aims
the aim is to design and create a web-based note-taking tool that uses spaced repetition reminders to enhance learning outcomes and promotes the creation of high-quality, self-generated notes.

- design web-based note-taking tool
- implement and host web-based note-taking tool
- test and evaluate web-based note-taking tool

=== Objectives
- Investigate and review current scholarly literature on note-taking techniques, spaced repetition, and the efficiency of digital teaching tools.
- Design a user-friendly web interface for creating, editing, and organizing personal notes, with support for file upload
- Implement a secure user authentication system to allow users to register, log in, and manage their own notes and review schedules.
- Develop a reminder system that notifies users when it is time to review specific notes, via email or in-app prompts.
- Ensure data persistence using a lightweight database (SQLite) and manage note, user, and review data securely.
- Evaluate the application through testing of core features, usability, and alignment with learning theories discussed in the literature review.
== Scope and Limitations
=== Scope
The goal of this project is to design a web-based note-taking application that motivates students to actively compose and go over their own study notes.
Creating and modifying notes, uploading files (such as PDF, DOCX, and TXT), registering and logging users, and implementing
a spaced repetition system that sends reminders depending on review schedules are among the essential features. To assist self-directed 
learners, the application features an easy-to-use interface. Python with Flask, SQLite for data storage, 
and other tools like Waitress for deployment and APScheduler or a similar program for managing review reminders are used in the backend's construction.

Individual users are supposed to utilise the system to manage their own study materials. It is intended for secondary or college students who favour
adaptable and intellectually stimulating study aids. By encouraging active learning habits and offering incentive elements, the app promotes self-regulation.

=== Limitations
Because it is a prototype, the project's scope and complexity are constrained. Real-time device syncing and collaborative note-taking are not supported. 
The spaced repetition approach does not modify review intervals according to actual recall performance or difficulty level because 
it is based on fixed logic rather than adaptive learning algorithm.

Furthermore, not all deployment setups may ensure email reminders, which rely on external configurations. 
Advanced security features like two-factor authentication and encrypted note content are not included in the system. Finally, usability 
insights are based on limited peer and personal input because the program will not been reviewed through extensive user testing due to time and resource restrictions.
#pagebreak()
= Literature Review

== Note Taking 
Technological advancements made in recent decades have improved access to information and technology which has also advanced note taking. The digitization of note taking in recent years has sparked research in the effectiveness of digital note taking with one paper suggesting that digital notes taken on a laptop @Luo2018-md are more effective than long-hand notes for similar-text related learning and image-related learning whereas long-hand notes are more effective for text-related learning however, the paper concludes that the effectiveness of either note-taking method largely depends on the contents as well as whether the notes are reviewed suggesting that spaced repetition should be used. A separate thesis claims that note-taking effectiveness also depends on whether the notes are self-generated or guided notes @blankenship2016comparing suggesting that while guided notes alleviate the cognitive load on individuals, they could be less effective than self-generated notes because the individual would not be able to express as much freedom in their note-taking, potentially limiting their ability to create personal and meaningful notes developing relations between notes and learning material. Interestingly, the thesis claims that neither note-taking method outperformed their control condition on a multiple-choice quiz suggesting that there are many variables that need to be evaluated when considering the effectiveness of notes which are the quantity, quality, mode of note taking and review of notes @blankenship2016comparing. These studies imply that a balance of high quality and quantity of notes is required in either mode of note taking whether digital or long-hand for improved results. 

The thesis @blankenship2016comparing also discusses student preferences between guided notes and long-hand written notes where it claims that students generally prefer guided notes and since they found that neither mode of note-taking is more effective than the other but the effectiveness solely depends on the quality, quantity and repetitive review of notes,  you could assume that there is no reason to create notes yourself however, a report on strategic note taking for students @Salame_Thompson disagrees and claims that strategic note-taking (self-generated note-taking) is an important skill involving the processing of information and writing and listening skills, suggesting that students with better note-taking skills achieve better grades. It argues that students who copy information for notes instead of actively processing it themselves are negatively affecting their studies because they do not fully understand the material therefore the notes are not beneficial to them. The report suggests that students should aim to improve their note quality by actively processing the learning material as it is the most beneficial while recognizing that some students find it difficult to recognize and organize content based on relevance, with that in mind it discusses an experiment involving middle school students @Salame_Thompson who use strategic note-taking and based on the results draws a conclusion that active self-generated notes are generally higher in quality therefore lead to improved understanding of the material which in turn leads to better grades. The report discussed thoroughly and reasonably explained why active notetaking is vital to students. However, it does not discuss how to improve note-taking skills or how often notes should be revised. 
The reviewed literature about note-taking provides insights about how valuable they can be when an individual actively processes information and creates notes of the information and periodically reviews the notes. However, based on the data of a survey conducted in 2019 @Morehead2019, approximately half of students in university do not take notes as the lecture and lab study materials are available to the students online removing the need for students to attend live lectures or labs. As technology further advances and more study materials are digitized students do not feel the need or the pressure to take notes on material they can view anytime they need or use advanced tools to generate notes on the material, but these approaches do not help learn and understand the material, they simply rephrase the material @Salame_Thompson. For my project, users would have a list of suggestions that they could incorporate to improve the quality of their notes, but it is important to consider the difference between guidelines and suggestions as the purpose of the application is to allow users to generate their own notes.

== Spaced Repetition

Spaced repetition has become a highly researched subject due to the powerful effects it can have on learning when combined with high quality and quantity notes. Various studies about spaced repetition discuss the effectiveness of spaced repetition as well implications of using this study technique. Article by Sean H. K. Kang @kang_2016 discusses the spacing and interleaving of study material where he explains that interleaving items in various ways can achieve different results, for example, arranging study materials in categories “ABCABCABC” @kang_2016 would benefit motor skill acquisition and mathematics and problem solving whereas by blocking these items together you could aim to improve recognition and identification, the article Harnessing the power of spaced repetition learning and active recall @Marinelli supports some of Sean H. K. Kang's study claiming that spaced repetition is significantly more effective than standalone note-taking however it also discusses that active recall is overwhelmingly more effective than passive review of notes when combined with spaced repetition but I believe the article does not provide sufficient evidence to make such claims. The article @kang_2016 highlights the importance of interleaving as well as spaced repetitions, and the appropriate time frame for each spaced repetition is discussed and noted as one to eight days in between each repetition to assimilate the self-generated notes, unfortunately this article does not cover the number of repetitions to be performed which I believe to be a great oversight as. An article by Keiko Hanzawa and Yuichi Suzuki @Hanzawa_Suzuki briefly discusses that in their study 50% of students reported that six repetitions were beneficial while the rest reported that three to four repetitions were beneficial for them. Another study @Tabibian also suggests that the schedule of spaced repetition is vital to the effectiveness showing that an optimal time frame in between each repetition can be calculated and should be enforced for memorization improvements however, the article only explores guided learning material and not self-generated learning material for which an optimal space for each repetition would be significantly harder to calculate. From the discussed literature a conclusion can be drawn that a minimum of three repetitions is required to perceive some effect from spaced repetitions. On top of this, a maximum of six spaced repetitions should be enforced to reduce the tedium of repetitions while also maintaining the engagement of students.

My proposed project will be using spaced repetition by notifying the user when they should revisit their notes. The goal of this project would be to make effective use of spaced repetition to improve how easily and quickly information is assimilated over time. There are countless applications that use spaced repetition however, the repetition is based off guided or pre-generated material which aims to remove the need for note-taking. The article about effectiveness of digital note-taking @Sun_Li discusses the importance of engaging with the learning material and it being cognitively challenging by forcing the individual to process it themselves rather than the learning material already being processed, I have come to the conclusion that other applications fail at being cognitively challenging which in turn makes the spaced repetition less effective, this is where my project could improve upon by giving individuals the freedom to be cognitively challenged by the material they are studying based off which they can create high quality notes, which can later be reviewed periodically.


== Effectiveness of Note-taking and Revision Help Applications

Study and Notetaking applications and tools have become more prevalent in recent years claiming to be extremely effective and promising easily achievable improvements in learning and memory. A Japanese study evaluating a note-taking applications effectiveness @JapanesePhysicians found that 45.3% of the 3833 study participants used the note-taking application and achieved variable 25% higher scores in their medical training examination than non-app using participants depending on the individuals age, workload and whether they used online resources on top of the note-taking application. However, the study does not incorporate or review the effects spaced repetition could have on the results, I believe that using a note-taking application and incorporating variable spaced repetition the students would be able to assimilate more information therefore be able to achieve better results. A similar article evaluating another digital note-taking application @Calamlam suggests that individuals who can consistently use the note-taking application to create high quality notes, achieve better results in tests. The article explores the idea that students need to be able to self-regulate well to achieve good results however, it concludes that it is not the case, and students do not have to be good self-regulators to achieve higher results. This finding supports my proposed project because by arguing that the individual using the note-taking application can achieve similar results whether they can or can't self-regulate as much as other people, if they have some level of motivation to learn and improve they will.

However, a study on the impact of digital distraction on lecture taking notes and student learning @Flanigan2020 states that digital distractions reduce quality and quantity of taken notes which relates to self-regulation as a person who can self-regulate better would be less affected by distractions, therefore be able to produce higher quality notes. This is vital to consider for my project, the whole web application hinges on the individual using it, being able to self-regulate and actively process information to produce high quality notes which they can then review after a period of time. One way my project could potentially improve the user's ability to self-regulate is by trying to motivate them through motivational quotes which according to the Qualitative Study of the Psychological Effects of Motivational Quotes @Sun2024, motivational quotes have a positive effect on individuals with the limitation being potential overexposure to motivational quotes leading to reduced motivation. From the study we can infer that sparingly using motivational quotes could help individuals become motivated and stay motivated throughout their time studying which is important as discussed in the comparative analysis of learning, retention, and study strategies article @Ehsanpur, which concludes that digital learning is much better with the caveat being reported motivation to keep studying being significantly lower. 


== Conclusion

Firstly, note-taking has advanced significantly in the last decade with digitised note-taking being the dominant variant of taking notes. Most students preferring guided notes over generating their own ones implies that note-taking is becoming less popular although the benefits of note taking are real and when combined with spaced repetition creates an effective learning strategy. Modern students often use tools to rephrase or auto-generate notes which skips note-taking but does not foster understanding thus having worse results. 

Secondly, there is a lack of research in specifically how students can improve their note-taking abilities however, from the reviewed literature I am suggesting that to improve note quality the individual should consider the relevance, detail and whether their notes form complete coherent thoughts. When considering these suggestions one could improve the quality of their notes.
 
Lastly, the aim of my project will be to create a note-taking app which encourages higher quality notes while also using the spaced repetition (of 1-8 days) learning strategy which has been highly research to be a simple and effective strategy to learn material of varying complexity and quantity. Although my research has shown some potential challenges my project could present such as maintaining user motivation, I believe that my design and implementation of the project would solve these issues. 


#pagebreak()
= Requirement Analysis

I want to build a web application that can be used students to take notes, store files and set reminds for revision.
A web application will is convinient for students as it could be used on almost any device, backing up student work could be handled on the server which would take cognitive load off from students. A few drawbacks that I can think of at the moment are the that an internet connection would be required for students to access their data, privacy and security issues concerning user data.

== functionality requirement checklist
I have wrote a checklist for the functional requirements. I will use the checklist during the testing phase of the project to test my artefact and evaluate if I have met my requirements.  

- Note functionality
    - Create note
    - Load note
    - Update (save) note
    - Delete note
    - Search notes
- File upload functionality
    - Upload file
    - Delete file
    - Update file
    - Search files
- User account functionality
    - Create account
    - (Optional) Delete account
    - Login
    - Log out
- Reminder functionality
    - set reminder manually
    - view upcoming reminders
    - view past reminders
    - search reminders
    - send email as a reminder to users.
- Over-lapping functionality
    - attach file to note
    - have an option with sane defaults to create a note with a reminder
    - attach file to a reminder.  
    - (Optional) performance metrics
    - (Optional) PWA for push notifications

== non functional requirement checklist

- responsive UI
- fast load times
- secure data storage
- privacy (users can only access their notes) 

== constraints

Since the artefact is a prototype, I will be using a simpler database and self hosting the project on my server. 
This will ultimately affect the number of concurrent users the prototype would be able to handle as a single machine will 
be limited by network speed, cpu speed and storage speed. Another constraint is time, at the moment of writing this, 
I have 2 weeks left till the submission date, I simply do not have time to learn new tools, so I will be using tools 
I have already used. I rent a linux virtual private server (vps) that I can host this project on. 
I have experience using Python, Flask, HTMX and Sqlite3 to write dynamic web applications. 
Due to the time constraints to learn new skills, I have labelled a few functionality requirements as optional.

== feasibility

A web app with CRUD functionality is nothing new and not complicated. I should be able to do the whole app in a few 
days to implement the core functionality. I will have to learn how to set up my own email server to send reminders to users and how to integrate it with my python application.
#pagebreak()
= System Design

== Artefact Architecture
#figure(
  image("../system_design/artefact architecture.png"),
  caption: [
   Proposed architecture
  ],
)

== UI navigation diagrams
#figure(
  image("../system_design/UI_navigation.png"),
  caption: [
   UI navigation mockup
  ],
)

== UI Mockups
=== Landing Page
#figure(
  image("../system_design/landing_page_design.png"),
  caption: [
   landing page design
  ],
)
=== Login / Register Page
#figure(
  image("../system_design/login_page_design.png"),
  caption: [
   login page design
  ],
)
=== User Dashboard
#figure(
  image("../system_design/user_dashboard_design.png"),
  caption: [
   user dashboard design
  ],
)
=== Single Item View
#figure(
  image("../system_design/single_item_view_design.png"),
  caption: [
   single item page design
  ],
)
=== Item List View
#figure(
  image("../system_design/item_list_view_design.png"),
  caption: [
   item list page design
  ],
)

== Database Design
#figure(
  image("../system_design/ERD.png", width: 80%),
  caption: [
   Entity Relation Diagram (ERD)
  ],
)

== App Endpoint Design
#figure(
  table(
    columns: 5,
    [HTTP Method], [Endpoint], [Description], [Request Body],[Response],
    [`GET` ], [`/notes`], [Fetch all notes for a user ], [blank], [List of Notes] ,
    [ `GET`],[`/notes/<id>`],[Fetch single note by ID],[blank],[Note object representation],
    [`POST`], [`/notes/`], [ create new note], [Title, content], [redirect to new note],
    [`PUT`], [`/notes/<id>`], [update a note], [fields to update], [redirect to updated note],
    [`DELETE`], [`/notes/<id>`], [delete a note], [blank], [redirect to list of notes],
    [`GET`], [`/uploads`], [fetch all uploads for a user], [ blank], [list of user's uploads],
    [`GET`], [`/uploads/<id>`], [fetch an upload by ID], [blank], [single upload details],
    [ `POST`], [`/uploads`], [create upload record and save file], [file], [redirect to upload details.],
    [`DELETE`], [`/uploads/<id>`], [delete upload], [blank], [redirect to user's uploads],
    [`GET`], [`/reminders`], [fetch all reminders for a user], [blank], [list of user's reminders],
    [`GET`], [`/reminders/<id>`], [fetch a reminder by ID], [blank], [single reminder details],
    [`POST`], [`/reminders`], [create reminder record and save file], [title, task, email_sent, review_date], [redirect to reminder details.],
    [ `DELETE`], [`/reminders/<id>`], [delete reminder], [blank], [redirect to user's reminders],
    [`POST`], [`/reminders/<id>/attach`], [attach reminder to note], [note id], [redirect to note],
    [`POST`], [`/uploads/<id>/attach`], [attach upload to note], [note id], [redirect to user's note],
    [ `POST`], [`/reminders/<id>/deattach`], [de-attach reminder from note], [note id], [redirect to note],
    [`POST`], [`/uploads/<id>/deattach`], [de-attach upload from note], [note id], [redirect to user's note],
  ),
  caption: [App endpoint design],
)

== Security Considerations

=== Authentication
- Session management: use secure, signed session tokens that are validated by the server. 

=== Password and User Credential Safety
- Store passwords using strong hashing algorithms
- Use email verification on signup 

=== Input Validation and Sanitization
Sanitize inputs for all endpoints to prevent injection attacks (SQL injection, XSS, etc.).
Implement server-side validation for all data including:
- Note titles/content
- reminder titles/descriptions
- Uploaded file metadata
- User inputs (IDs, emails, dates)

=== File upload security
- Only allow specific file types (.pdf, .docx, .txt, .png, .jpeg) by checking file extension.
- Limit file size (e.g., 10MB max) to save space, reduce load times and prevent a DoS.
- Store uploaded files outside the public web directory

=== Data Privacy
- use HTTPS for all communication
- Ensure users can only access their own notes, files, and schedules.

#pagebreak()
= Implementation
== Implemented views
I have implemented 3 out of 5 designed pages. I have implemented a simplified version of the item list view page, 
login/register pages and the landing page. Below I have included some images of the actual product. list view and edit pages 
slightly differ for notes, reminders and uploads because of slightly different information used to create the records.
=== landing page
#figure(
  image("../product_screenshots/actual_landing_page.png",),
  caption: [
   Implemented landing page
  ],
)

=== registration
#figure(
  image("../product_screenshots/actual_registration.png",),
  caption: [
   Implemented registration page
  ],
)
=== login
#figure(
  image("../product_screenshots/actual_login.png",),
  caption: [
   Implemented login page
  ],
)
=== list view
#figure(
  image("../product_screenshots/actual_list_view.png",),
  caption: [
   Implemented list view page
  ],
)
=== edit
#figure(
  image("../product_screenshots/actual_edit.png",),
  caption: [
   Implemented edit page
  ],
)

== Implemented database
The implemented database schema found at `/note_app/napp/schema.sql` is mostly faithful to the design, 
the only two exceptions being `file` table was renamed to `upload` with 3 foreign keys added and `users` 
table was missing a password field in the design, so I had to add one later. In the end, I did not use the upload table 
to store location of files because that won't be changing any time soon. I wrote a script that should create a user upload 
folder if one doesn't exist when files get uploaded. Here is the implemented schema below:
```sql
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS reminder;
DROP TABLE IF EXISTS upload;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT UNIQUE NOT NULL,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

CREATE TABLE reminder (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  note_id INTEGER, -- allow null because maybe a reminder is not linked to a note.
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  due TIMESTAMP NOT NULL , -- cannot use datetime to set as default
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  complete INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY (author_id) REFERENCES user (id),
  FOREIGN KEY (note_id) REFERENCES note (id)
);

CREATE TABLE upload (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  note_id INTEGER, -- allow null because an upload might not be 
  reminder_id INTEGER, -- allow null
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  upload_name TEXT NOT NULL,
  uploaded_file BLOB NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id),
  FOREIGN KEY (note_id) REFERENCES note (id),
  FOREIGN KEY (reminder_id) REFERENCES reminder (id)
);
```
== App endpoints
Out of the 17 entries in th app endpoint table, I have implemented 13. I had renamed several 
endpoints and limited myself to the use of `get` and `post` methods for the sake of clarity in my code. 
For example, create, update and delete endpoints now end with the their corresponding actions like so `/notes/<id>/update`.

#figure(
  table(
    columns: 5,
    [HTTP Method], [Endpoint], [Description], [Request Body],[Response],
    [`GET` ], [`/note/list`], [Fetch all notes for a user ], [blank], [List of Notes] ,
    [ `GET`],[`/note/<id>`],[Fetch single note by ID],[blank],[Note object representation],
    [`POST`], [`/note/create`], [ create new note], [Title, content], [redirect to new note],
    [`POST`], [`/notes/<id>/update`], [update a note], [fields to update], [redirect to updated note],
    [`POST`], [`/notes/<id>/delete`], [delete a note], [blank], [redirect to list of notes],
    [`GET`], [`/upload/list`], [fetch all uploads for a user], [ blank], [list of user's uploads],
    [`GET`], [`/upload/<id>`], [fetch an upload by ID], [blank], [single upload details],
    [ `POST`], [`/upload/create`], [create upload record and save file], [file], [redirect to upload details.],
    [`POST`], [`/uploads/<id>/delete`], [delete upload], [blank], [redirect to user's uploads],
    [`GET`], [`/reminders/list`], [fetch all reminders for a user], [blank], [list of user's reminders],
    [`GET`], [`/reminders/<id>`], [fetch a reminder by ID], [blank], [single reminder details],
    [`POST`], [`/reminders/create`], [create reminder record and save file], [title, task, email_sent, review_date], [redirect to reminder details.],
    [ `POST`], [`/reminders/<id>/delete`], [delete reminder], [blank], [redirect to user's reminders],

  ),
  caption: [Implemented App endpoints],
)

== Hosting
I failed to host the web application properly on time. I have installed apache2 and configured it as a reverse 
proxy with tls, it would point to a local waitress process that runs my flask application. However, 
I did not set up a persistent waitress process, so my server returns a `503 Service Unavailable` response. 
The web app is accessible only when I run the process as a user on the remote system over ssh.

#pagebreak()
= Testing
There are three main ways programs can be tested, manual testing, Unit testing and Behavior Driven testing (it is a part of Behavior Driven Development, BDD).
Manual testing is a fast way to test program functionality for small scale projects but as projects become larger and have more functionality it becomes significantly harder 
and slower to test the programs, it also relies heavily on the developer to fully understand their program and be able to account for edge cases. This form 
of testing is often used for prototyping or small projects. Unit testing is a powerful way to test and assess whether code matches specific criteria when executed, 
the key benefit of unit testing is that the test code can often be re-used and used to alter the tested code to perform specific actions. It is a form of 
semi-automatic testing that tests code functionality separated from the rest of the program which can unveil undesirable behaviors allowing for them to be fixed early. 
Lastly BDD is another form of semi-automatic testing that often uses gherkin specifications which are instructions written in plain language using keywords such as “when”, 
“given” and “then” to describe what a program should do, it is a very powerful way to test programs while also being simple enough to allow non-technical 
people to understand the functionality of the program. BDD is often used in large group software development where members of the group have varying degrees of 
technical knowledge allowing everyone to understand what code does or should do. One issue with BDD is the time it takes to set up, not only does it require gherkin 
specifications but it also requires code to be written to use the gherkin specifications to test code and the quality of gherkin specifications can determine how easily this is done.

=== Testing napp
For my project I have chosen to perform manual testing. There are several key reasons for this, 
one major reason being that I did not plan carefully enough to allow myself to implement all of  the features I wanted to implement, 
and I have spent a lot of time trying to implement certain features like file uploading or the automatic email system which meant I had less time to 
write Unit tests or Behavior-Driven tests. Another reason why I have chosen to perform manual testing is because my project is 
relatively small scale, this means I can quickly test features and edge cases and check whether my web application performs as I expect it to.

For my test cases where I must input user data I will use test data such as:
-	NappTestEmail\@gmail.com
-	NappTestUser
-	Password as : “”
-	Password as : secret
-	Test Note Title: Test Note
-	Test Note Body: My Notes
-	Edit Note: Edited Test Note
-	Edit Body: Edited Test Body
-	Reminder Title: Test Reminder
-	Reminder Body: My Test Reminder
-	Reminder Date: 10/07/2025
-	Edited Reminder Title: Edited Test Reminder
-	Edited Reminder Body: My Edited Test Reminder
-	Edited Reminder Date: 16/07/2025


=== Testing case 1
Case 1 tests whether an empty string is accepted as a password,
I believe an empty password should not be accepted as a valid password, therefore it should fail creation of the account with an empty password.
Upon clicking the highlighted register button the user should be taken to the registration page where they requested to input an email, username and a password.
#figure(
  image("../testing_images/case1_1.png",),
  caption: [
   case 1 , image 1
  ],
)
Here I will input “NappTestEmail\@gmail.com” and “NappTestUser” and “” as the password.

#figure(
  image("../testing_images/case1_2.png",),
  caption: [
   case 1 , image 2
  ],
)
When pressing the “Register” button registration should fail.
#figure(
  image("../testing_images/case1_3.png",),
  caption: [
   case 1 , image 3
  ],
)
The test passes, failing registration of a user with an empty password.

=== Testing case 2
Successfully registering the user with password “secret”
I have not implemented a length check for the password,
only a presence check. This means I will not be testing whether it accepts a single character as a password
because I know it will as I have not implemented a length check. With that being kept in mind, Case 2 tests successful registration.
I will be inputting the test data with the password “secret”. 
#figure(
  image("../testing_images/case2_1.png",),
  caption: [
   case 2 , image 1
  ],
)
Registration should be successful and the user should be prompted to log-in.

#figure(
  image("../testing_images/case2_2.png",),
  caption: [
   case 2 , image 2
  ],
)
I can now view the user NappTestUser in the database meaning that their registration was successful. The test passes as expected.

=== Testing case 3
Logging-in to a created account
From test case 2, I will be inputting the account details in the log-in screen where I will then be 
taken to the landing page logged-in as NappTestUser, showing additional buttons in the nav bar such as  notes, reminders and upload buttons.
Log-in page
#figure(
  image("../testing_images/case3_1.png",),
  caption: [
   case 3 , image 1
  ],
)
Inputting test user data.

#figure(
  image("../testing_images/case3_2.png",),
  caption: [
   case 3 , image 2
  ],
)
#figure(
  image("../testing_images/case3_3.png",),
  caption: [
   case 3 , image 3
  ],
)
Test has successfully passed and I am now logged-in as NappTestUser.

=== Testing case 4
Successfully logging out of the test user account.
The user should be able to log-out of their account by pressing the highlighted “Log Out” button at the top right of the screen in the navbar.
#figure(
  image("../testing_images/case4_1.png",),
  caption: [
   case 4 , image 1
  ],
)

By Pressing the “Log Out” button the user should be logged out and returned to the landing page.

#figure(
  image("../testing_images/case4_2.png",),
  caption: [
   case 4 , image 2
  ],
)
Test Case 4 passes the test and successfully logs-out the user from the application, working as expected.

=== Testing case 5
Taking Notes in the note page
Assuming the user is logged-in they can access their notes pressing the highlighted “Notes” button in the nav bar the user should be taken to the notes page.
#figure(
  image("../testing_images/case5_1.png",),
  caption: [
   case 5 , image 1
  ],
)
In the notes page, the user can press “New” to add a new note the page will then populate with two text boxes, one for the title and one for the body of the note contents

#figure(
  image("../testing_images/case5_2.png",),
  caption: [
   case 5 , image 2
  ],
)
The user can then input their notes, I will be using my test data.
#figure(
  image("../testing_images/case5_3.png",),
  caption: [
   case 5 , image 3
  ],
)
And pressing the “Save” button at the bottom left corner will create the note and store it.
#figure(
  image("../testing_images/case5_4.png",),
  caption: [
   case 5 , image 4
  ],
)

This test case passes as it behaves as expected.

=== Testing case 6
Editing Notes
I have implemented an edit feature for the taken notes. The user can press the edit button to edit an existing note
#figure(
  image("../testing_images/case6_1.png",),
  caption: [
   case 6, image 1
  ],
)
Pressing the “Edit” button on the right side of the note, 
a similar window to the create “New” note is show with the existing data, this can then be overridden and saved. I will be using my Test Data.

#figure(
  image("../testing_images/case6_2.png",),
  caption: [
   case 6 , image 2
  ],
)
Pressing the “Save” button saves the changes made
#figure(
  image("../testing_images/case6_3.png",),
  caption: [
   case 6 , image 3
  ],
)
Test Cast 6 also passed the testing as it is working as intended.

=== Testing case 7
Deleting Notes
To Delete the Notes the user must press “Edit” and then proceed to press the “Delete” button.

#figure(
  image("../testing_images/case7_1.png",),
  caption: [
   case 7, image 1
  ],
)
Pressing the “Delete” button should prompt the user whether they want to really remove the note taken.

#figure(
  image("../testing_images/case7_2.png",),
  caption: [
   case 7 , image 2
  ],
)
By pressing “OK” the user then agrees to permanently delete the selected note which should now show an empty list of notes.
#figure(
  image("../testing_images/case7_3.png",),
  caption: [
   case 7 , image 3
  ],
)
The test passed as expected.

=== Testing case 8
Setting a reminder
Currently I have not implemented the reminder functionally, however, a user can set the Title, contents of the reminder and date for when the reminder should be sent.
For this I will be going to the reminder page logged in as the test user.
#figure(
  image("../testing_images/case8_1.png",),
  caption: [
   case 8, image 1
  ],
)
Pressing the “New” button to create a new reminder which similarly to creation and editing of 
notes should expand the body of the page with textboxes for the user to input the Title, Body contents and date for the reminder

#figure(
  image("../testing_images/case8_2.png",),
  caption: [
   case 8 , image 2
  ],
)
Saving the reminder should store it and display it in the reminders page.
#figure(
  image("../testing_images/case8_3.png",),
  caption: [
   case 8 , image 3
  ],
)
This test case passes as the user can create a reminder, and it is stored and displayed as expected.

=== Testing case 9

Editing the reminder
Although the notification functionality of the reminder is not something I managed to implement, I have implemented editing of the reminders which works like the editing of the notes therefore I expect it to pass as well,
By opening the reminders page, we can see our previously set reminder, I can edit it by pressing the “Edit” button which should allow me to change the contents or delete the reminder.

#figure(
  image("../testing_images/case9_1.png",),
  caption: [
   case 9, image 1
  ],
)

#figure(
  image("../testing_images/case9_2.png",),
  caption: [
   case 9 , image 2
  ],
)
By pressing “Save” the reminder should update and the changes should display in the reminders page.
#figure(
  image("../testing_images/case9_3.png",),
  caption: [
   case 9 , image 3
  ],
)
Test Case 9 successfully passes and the changes made are stored and displayed correctly as expected.

#pagebreak()
= Experiment and  Results
The experiment was going to involve students testing the application in their studies for a period of time. However, I failed to finish implementing the 
core features of the application so the experiment cannot take place nor are there any results to discuss.

#pagebreak()
= Evaluation
To critically evaluate my attempt at developing a solution for the proposed research question I must consider every aspect of the project,
from the conception to the research made as well as the design and implementation of the program and the testing involved.

== Conception and Literature Review:

Based on some research I decided to create a note-taking application which aims to notify users periodically to review their notes to encourage spaced repetition,
 I believe this idea is something that is not currently available and could therefore fill in a need for a product like that.
Once I had decided to do a note-taking application I started the literature review where I researched and reviewed existing articles, reports, and studies about 
note-taking as well as existing applications that perform similar functions.
I believe I performed my research quite well and formed a strong basis off of which I could plan and design my application to try to create a solution for my proposed problem.
However, one area of improvement would have been to try and find more statistics based on learning and note-taking as well as learning tool usage to better 
support my proposed project.

== Planning and design:

In the planning and design stage of my project I detailed the necessary requirements of my project as well as discussed possible constraints and the feasibility 
of the project as a whole.
I believe the requirements I have written were enough for me to design the program however,
I severely underestimated how long it would take to implement everything when discussing the feasibility of the project,
although I still believe that majority of the features are not incredibly difficult to implement therefore I was not pushing past my limits 
but the time taken to learn new skills like the implementation of the file uploading or sending email notifications to users was something I underestimated 
which caused me to not be able to implement them in time. In hindsight I should have prepared better and allocated more time to feature implementation that I was unfamiliar with.


== Implementation:

Before starting development I planned to use python and flask to create the web application which overall did work, 
however, python being considered a relatively “easy” language and flasks large and up-to date documentation led me to believe that it will be easy to implement everything 
I needed to implement from the requirements in a short span of time, unfortunately that was not the case and I found myself unable to implement everything so quickly. 
Had I chosen a different language with a different framework so that I perceived them to be difficult I may have been more motivated to work on the project earlier and could
have allocated more time to the implementation.
I have successfully implemented most of the features and have a basic web application working, with working account creation and storage,
log-in and log-out functionality as well as the creation, editing and deletion of notes and reminders. However, currently the reminders act the same way as the notes
as I was not able to implement the email notification feature in time. I believe that while I managed to add CRUD functionality I should have focused more on the core feature 
of sending email notifications as that is the main feature that aims to address the research problem of whether learning can be improved through a note-taking application using
spaced repetition which now is harder to answer as the notification sending feature is also the feature that would have separated my application from a basic notes app
that exists on most consumer devices and operating systems locally by default. 


== Testing:

The testing performed was manual testing which I chose for several reasons like saving time and simplicity 
due to the small amount of functional features implemented. Upon review of my project I believe I should have tried harder and still at the very
least attempted to implement unit testing as it could have potentially saved me time while developing my program by applying test driven development techniques,
it could have saved me time rewriting code by finding unintended behaviours sooner. While I believe my current project is bug free,
the lack of more in depth testing such as BDD or unit testing means that I cannot with certainty claim that it is perfectly functional as there may
be bugs or security flaws that could be found through more in-depth testing. The tests performed did pass but is not entirely a good thing, 
not finding issues with my program means that there is likely something I am not aware of and some edge cases exist that could either crash the program or cause security issues.

== Challenges faced with the project as a whole:

The biggest challenges were motivation, time management, and lack of preparation to undertake a full project. 
Motivation in particular has been one of the main reasons as to why this project did not go as planned and left many areas of it to be improved. 
I believe the cause of this is my depression of which I have been diagnosed by my gp and have been taking medications to attempt to improve my motivation. 
I believe the medication is working as I have given this project a significantly better attempt than my previous years project even if there are many issues 
with the project and several key features not implemented. My motivation is something I am trying to improve and my depression is something I am also trying to alleviate 
by exercising and taking prescribed antidepressants. 

Another major challenge for me was time management, 
the project as a whole feels extremely large even if it is not, everything needs careful and detailed planning and consideration which can 
be quite difficult to achieve when trying to complete the work quickly. Managing the writing of the report while trying to learn how to use flask and 
python proved to be challenging for me and hosting and deploying my project myself also took a long time which I did not account for. 
If I was to do another project like this I could create a basic plan of what needs to be completed and then break down each feature or task into smaller ones 
until I have a list of things to complete that are small enough for me to maintain my motivation and not be overwhelmed.

== Overview of the project as a whole and it's success:
 
My overall poor time management skills and lack of knowledge and preparation led me to grossly underestimate how long or 
how difficult certain features would take to implement in my project, which in turn led me to rush the development, 
only giving me time to implement basic CRUD operations and deploying the web application on my linux server. 
While some arguments could be made that the application could still be used to improve learning by applying spaced repetition, 
the main feature that encourages is not implemented therefore I could not have had people use my application and test the spaced repetition which 
means I cannot draw an appropriate conclusion based off of my project to answer the academic question, It instead will be based off the literature and my project combined. 

There are countless things I could have done differently with the most important one being starting the project earlier 
but I found this very difficult due to my mental health issues, I received an extenuating circumstances extension and 
I still found it extremely difficult to start and complete the project. I believe what should have done is apply a principle
of divide and conquer with the project and report, breaking down everything I had to do, how I would do it and when 
I would do it in a better manner than I have now with my current planning and design. The program does have the core CRUD 
features with the most important ones being creation, editing and deletion of notes which would make my web application actually usable for 
its intended purposes which is note-taking however, it is missing many security features and functionalities that I did initially 
plan to implement but was unable to do so in a two week timeframe. On top of other functionality that I have not implemented, 
I also did not have enough time to add the privacy policy and terms of service to my web-application; however, I have drafted these. 
The consequences of not adding either to the web-application are that users can technically use the application in any way they want 
if they even choose to use it because there is nothing to reassure them that they're data is secured (like by including a privacy policy page).

Overall, my attempt at the project was unsuccessful as I have not finished my project and I am unable to answer my academic question and provide evidence 
of my project solving or improving learning. On the other hand, there are many articles and studies that are in support of my 
project meaning that in theory, if I had actually successfully implemented everything and then surveyed people using my web-application, 
it would have been likely that my project would have been beneficial to learning to some degree, unfortunately, I cannot claim 
that as I do not have the evidence based off of my project to support this claim.


#pagebreak()
#bibliography("works.bib",style: "harvard-cite-them-right")