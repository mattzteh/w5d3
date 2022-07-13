DROP TABLE IF EXISTS question;
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
    id INTEGER PRIMARY KEY,
    writer_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(writer_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname,lname)
VALUES 
    ('Bob','Skywalker'),('John','Wick'),('Mike', 'Hawk'), ('Anakin','Skywalker'), ('Frodo', 'Baggins');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('How to get girls?', 'Hi, I have been single all my life. How do I improve my pick up game to land my first date? Any advice is helpful!', (SELECT id FROM users WHERE fname = 'Bob' AND lname = 'Skywalker')),
    ('Where is nearest dog adoption center?', 'Hi, a Russian dude just killed my dog that my wife gave me. Need any suggestions on where to adopt a puppy!', (SELECT id FROM users WHERE fname = 'John' AND lname = 'Wick')),
    ('How to impress my boyfriend Bo?', 'My boyfriend says he is unsatisfied with my...COOKING! How do I get better in the kitchen?', (SELECT id FROM users WHERE fname = 'Mike' AND lname = 'Hawk')),
    ('Where to purchase new limbs?', 'My master recently burned me alive on the planet Mustafar and cut off my arm and two legs. Where can I purchase good quality limbs in the galaxy?', (SELECT id FROM users WHERE fname = 'Anakin' AND lname = 'Skywalker')),
    ('Where to get best weed?', 'I ran out of Pipe-Weed and need some good stuff to last me through my journey to Mordor. Any suggestions are helpful!', (SELECT id FROM users WHERE fname = 'Frodo' AND lname = 'Baggins'));

INSERT INTO
    question_follows (question_id, follower_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'How to get girls?'), (SELECT id FROM users WHERE fname = 'Bob' AND lname = 'Skywalker')),
    ((SELECT id FROM questions WHERE title = 'Where is nearest dog adoption center?'), (SELECT id FROM users WHERE fname = 'John' AND lname = 'Wick')),
    ((SELECT id FROM questions WHERE title = 'How to impress my boyfriend Bo?'), (SELECT id FROM users WHERE fname = 'Mike' AND lname = 'Hawk')),
    ((SELECT id FROM questions WHERE title = 'Where to purchase new limbs?'), (SELECT id FROM users WHERE fname = 'Anakin' AND lname = 'Skywalker')),
    ((SELECT id FROM questions WHERE title = 'Where to get best weed?'), (SELECT id FROM users WHERE fname = 'Frodo' AND lname = 'Baggins'));

INSERT INTO
    replies (parent_id, question_id, writer_id, title, body)
VALUES
    ((SELECT id FROM questions WHERE parent_id IS NULL), (SELECT id FROM questions WHERE body = 'Hi, I have been single all my life. How do I improve my pick up game to land my first date? Any advice is helpful!'), (SELECT id FROM users WHERE fname = 'Anakin' AND lname = 'Skywalker'), title = 'Just force-choke her', body = 'My soon to be fiance, Padme, was a liar, so I force choked her and she died from sadness.')),
    ((SELECT id FROM questions WHERE title = 'Just force-choke her'), (SELECT id FROM questions WHERE body = 'Hi, I have been single all my life. How do I improve my pick up game to land my first date? Any advice is helpful!'), (SELECT id FROM users WHERE fname = 'John' AND lname = 'Wick'), title = 'I have 40 years of experience', body = 'Just trust me bro, if you become a professional assassin like me, all the girls will swarm on you,');

INSERT INTO
    question_likes (writer_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Bob' AND lname = 'Skywalker'),(SELECT id FROM questions WHERE title = 'How to get girls?'))
    ((SELECT id FROM users WHERE fname = 'Mike' AND lname = 'Hawk'), SELECT id FROM questions WHERE title = 'How to impress my boyfriend Bo?'));
