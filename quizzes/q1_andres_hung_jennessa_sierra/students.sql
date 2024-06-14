DROP TABLE IF EXISTS Students;

CREATE TABLE
    Students (
        id SERIAL PRIMARY KEY,
        firstName TEXT NOT NULL,
        surname TEXT NOT NULL,
        dateOfBirth DATE NOT NULL
    );