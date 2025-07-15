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
  due TEXT NOT NULL , -- cannot use datetime to set as default
  time TEXT,
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