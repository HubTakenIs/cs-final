# Implementation diary

I will note down issues I encountered during the development of my artefact.

## Database

Sqlite3 doesn't support the use of datetime function as a column default value. it's at all not a problem for my use case but I wasted 20 minutes.

Logging my time has been a nuisance. I have wasted a significant amount of time on logging time and it has created some motivational struggles. I will stop logging time and commit more often.

maybe have a daily log where I spend 5-15 reflecting on the day's work.


## code

Ran into a few bugs caused by relavite path used for a few functions. The issue I was having while trying to host the application was that whenever I installed the built python module
it would not use the correct path to initialise the database, as well as upload folders. I have also failed to error handle the function that creates the directories.