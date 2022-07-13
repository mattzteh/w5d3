PRAGMAforeign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_follow_id INTEGER NOT NULL,
    follower_id INTEGER NOT NULL,

    FOREIGN KEY(question_follow_id) REFERENCES questions(id),
    FOREIGN KEY(follower_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_id INTEGER,
    question_id INTEGER NOT NULL,
    writer_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(writer_id) REFERENCES users(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id),
);

CREATE TABLE question_likes (
    like_question
    writer_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(writer_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

