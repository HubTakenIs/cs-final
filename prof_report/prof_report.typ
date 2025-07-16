#set heading(numbering: "1.")

#outline()
#pagebreak()

= Introduction

The following report covers social, ethical, legal and security considerations made for my project as well as general discussion of said aspects. The report explains each consideration made and why they are important, it also cover other aspects like licencing of code and frameworks used. The aim being to discuss the considerations made while developing my project as it is vital to consider these aspects in any personal, academic and business project.
= Social impact considerations

My web application is a tool used to create notes and study them periodically. The positive social impacts are that it could enhance education and push individuals to engage in self-directed learning which is highly beneficial as stated in the study on strategic note-taking and its impact on performance @Salame_Thompson because it forces students to actively process the information themselves which creates deeper links between information they are trying to learn and their notes, the study found that students engaging in active note-taking perform better than students that do not. Based on this my application could improve learning. 
The normal negative social impacts of using the internet such as addiction and mental health disorders like depression and anxiety @Vijay_Duggappa_2024 are less applicable to my application, since it is not a social media application, it is a self-study tool and does not include user to user interaction therefore removing the factor of online bullying and other factors like addictive software design such as the ones used in most modern social media applications where they aim maximise user retention. Instead, my web application aims to build a routine and good note-taking habits which could improve the individual's mental health.
With the intended use of the application being self-generated notetaking, the user is responsible for taking notes and routinely reviewing their notes. One possible social impact could be users grouping together to use this tool and sharing their notes, this would be an unintended use of the application however it would not create negative social impacts but it could lead to worse individual performance as inferred from the literature review stating that spaced repetition is most effective when the notes are self-generated.

= Ethical issue considerations
A major ethical consideration made is accessibility, through the use of responsive design the application is accessible from mobile devices as well desktop devices that have access to the internet and a web browser. This significantly increases the number of people who could access and use the application as some people do not have access to a computer but may have access to a mobile device. Almost 60% of the worldwide web traffic is from mobile devices with 37.78% coming from desktop computers @imedbouchrika_2021_mobile which means that responsive design is not something desired but something that is required for modern web applications. 
Another ethical concern that I have considered is the use of my application, how I intend users to use it and how they could potentially use it. The intended use is to take notes of some resource or material and then actively review the notes taken over a period of time for the purpose of learning. Unfortunately, some users may use the note-taking app as a tool for malicious activity such as drafting malicious emails or storing stolen data, for this there is no way i can stop users from performing such acts however, my terms of service states that the application is not to be used for malicious purposes and anyone found doing so will be banned from using my application, losing access to their data. On top of this, it is against my terms of service to attack my application and attempt to steal user data, anyone found doing so will be banned. It would be unethical and almost impossible for me to monitor each users notes without breaching their privacy therefore, as my terms of service state, users should not use the application for malicious purpose and they are responsible for their own data and passwords, as long as no breach has occurred on my end, the users are responsible for their own personal information security and contents of their notes.

The ethics of intellectual property and transparency are also considered. As stated in the terms of service, my application does not use or distribute user-generated notes unlike many other applications which aim to profit from user data or use user-generated content to train Large Language Models @dechazal_2018_20. Users have a right @govuk_2022_intellectual to their self-generated notes, as stated in the terms of service the exception being when users use the note-taking application for malicious purposes, as a result of which they forfeit their rights to their self-generated content which could be used as incriminating evidence for the authorities. The transparency of my terms of service should make users more comfortable and confident while using my application.

Lastly I have also considered how I could and whether I should monetize my note-taking application. At the moment the running cost of the application is very low therefore as it currently stands there will be no monetization  features implemented however, if in a hypothetical scenario my note-taking application builds a significant user base the cost of running the application would also rise and I would need to implement some form of monetisation whether it is through crowdfunding, or advertisements or affiliation with other organisations or brands. In the case where my application gains a significant user base, I believe the best form of monetisation would be crowdfunding as it is less invasive than advertisements and gives users the choice to directly support the development and maintenance of the tools they are using.

= Legal implication considerations
The main laws and regulations considered when developing my application were the EU and UK General Data Protection Regulation (GDPR) @governmentofuk_2018_data. The European Union (EU) GDPR has seven main principles that need to be adhered to @ukgovernment_2018_uk.
1.	Transparency, fairness and lawfulness when processing data.
2.	Any data processed must be done so for legitimate purposes which must be specified when collecting the data.
3.	Only data that is required must be collected.
4.	Stored data must be kept up-to date and accurate.
5.	Storage of data can be for as long as necessary as long as it is used for a legitimate necessary purpose.
6.	Data that is processed must be processed in a way that maintains security, confidentiality and integrity of data.
7.	The data controller is responsible for adhering to GDPR and must be able to show evidence of compliance to the regulations.

The UK version of adopts all of the EU regulations however also adds additional regulations for the collection, storage and processing of @ukgovernment_2018_uk:
1.	Ethnic background data
2.	Personal political opinion data
3.	Religious beliefs
4.	Health, physical and mental
5.	Sexual orientation
6.	Criminal history

The note-taking application developed complies with all principles and the UK's additional regulations added to the EU GDPR do not inherently apply to the application as none of the above personal information is being collected or used by the application, a user account is based off of their email and a password they create. By not collecting additional personal information from the users I only have to consider the users potentially taking notes of their personal information, this is covered by the terms of service where it states that users are responsible for the data they choose to store in the note-taking application and only in the event of my database being breached would I be legally responsible for the protection of their data. What this means is, that in the case of a user storing personal information in their notes, and they themselves accidentally leak their data, they are responsible for that.

Lastly, the terms of service cover most legal aspects to be considered. My terms of service meet the criteria to be legally binding, the user must accept or decline the terms of service, to use the application, the user must accept and comply with the terms of service.


= Security considerations
Since my application is a prototype, very few security measures have been implemented but I have made a few considerations that could be implemented to improve security.
== Securing the box
To secure my linux vps, I have set up passwordless ssh authentication for a non-root user. I have disabled root user login with password. I set up the waitress process to run under a non-root user. This follows best practice for securing a remote linux box and running a web server.
== Using https and reverse proxy
To use https, I have set up an Apache2 instance as a reverse proxy to the Waitress process running my flask app. Flask and Waitress does not natively handle HTTPS well, so using Apache2 was the simplest and quickest solution to support TLS encryption. 

Apache2 can also be used later to set up static file handling, centralised logging and control of timeouts, caching, headers and compression.

== file uploads
For file upload security I have implemented allowed file type check. I only allow registered and logged in users to upload files to the app and users can only access their own uploaded files. The files are stored outside Apache's public web directory and the file names are filtered to escape any malicious file names by Werkzeug's `secure_filename` function. 

In the future I should limit file sizes.
== User authentication

Any users are allowed to register to the application. They are authenticated by the app using their credentials. Passwords are stored as hashes in the database. signed session tokens are used to validate user requests. Most application endpoints require users to be logged in to view content and interact with the application. 

For the future, I should implement email verification and 2 factor authentication to improve security.

== Input validation and sanitation

As the app is a prototype, input validation and sanitation is very limited. For the future, I would need to validate email addresses during registration. I would need to sanitise note title and body fields. Anything that gets inserted into the database would have to be sanitised. The only sanitisation I have implemented is using Werkzeug's `secure_filename` to generate secure file names.

= Licensing
I chose the MIT license for a few reasons. The license is short and written in plain english, so it's easy to understand what users can use the code for. The license contains a liability disclaimer which in theory should keep me protected from legal responsibility and the license makes it easy for interviewers to try out my code without licensing issues. The ultimate freedom for users that MIT license provides encourages broader adoption and modification. If students wanted to self host my application or modify it to suit their particular needs, they can do so without fear of any legal repercussions.

#pagebreak()

#bibliography("works.bib",style: "harvard-cite-them-right")