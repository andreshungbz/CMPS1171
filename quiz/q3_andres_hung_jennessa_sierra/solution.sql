-- Andres Hung Jennessa Sierra CMPS1171 Quiz 3
-- 2024/02/26

-- SECTION FOR library.sql

-- drop linking table first
DROP TABLE IF EXISTS book_author CASCADE;

DROP TABLE IF EXISTS book;
CREATE TABLE book (
    id serial PRIMARY KEY,
    title text NOT NULL,
    isbn text NOT NULL,    
    page_count integer NOT NULL,  -- how many pages in the book
    publication_date date NOT NULL DEFAULT NOW()  -- automatically inserted by PostgreSQL
);

DROP TABLE IF EXISTS author;
CREATE TABLE author (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

-- Add your insert statements here

INSERT INTO book (title, isbn, page_count, publication_date)
VALUES
('Database Processing', '123456789', 670, '2023-09-12'),
('A+ Computer Repair', '987654321', 505, '2022-10-11'),
('C++ How to Program', '997755331', 644, '2021-11-29'),
('Intro to Computer Science', '554632231', 893, '2021-01-01'),
('Learn PostgreSQL 16', '667785343', 430, '2023-12-07');

INSERT INTO author (first_name, last_name)
VALUES
('David', 'Kroenke'),
('Sally', 'Gates'),
('Jorge', 'Martinez'),
('George', 'Kalos'),
('Randall', 'Smith');

-- book_author linking table

CREATE TABLE book_author (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES book (id),
    author_id INT REFERENCES author (id)
);

INSERT INTO book_author (book_id, author_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 4),
(5, 5);

-- #4

SELECT B.title AS book_title, A.first_name AS author_first_name, A.last_name AS author_last_name
FROM book AS B
INNER JOIN book_author AS BA
ON B.id = BA.book_id
INNER JOIN author AS A
ON BA.author_id = A.id;

-- SECTION FOR gpa.sql

DROP TABLE IF EXISTS student CASCADE;
CREATE TABLE student (
    id serial PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    gender text NOT NULL CHECK (gender IN ('male', 'female'))
);

INSERT INTO student(first_name, last_name, gender)
VALUES 
('Joe', 'Smith', 'male'),
('Jane', 'Sosa', 'female'),
('Jill', 'Sanchez', 'female');

DROP TABLE IF EXISTS grade;
CREATE TABLE grade (
    id serial PRIMARY KEY,
    student_id integer REFERENCES student(id),
    semester integer NOT NULL,
    gpa numeric(3, 2) NOT NULL
);

INSERT INTO grade(student_id, semester, gpa)
VALUES
(1, 1, 3.50),
(1, 2, 2.88),
(2, 1, 3.25),
(2, 2, 3.75),
(3, 1, 3.55),
(3, 2, 3.50);

-- #5

SELECT MAX(temp.count) AS max_gender
FROM (
    SELECT gender AS student_gender, COUNT(gender)
    FROM student
    GROUP BY gender
    ) AS temp;
    