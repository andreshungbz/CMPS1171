-- Demonstrate subqueries
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

-- find the average gpa
SELECT COUNT(*)
FROM 
(
SELECT S.first_name, S.last_name, G.gpa
FROM student AS S 
INNER JOIN grade AS G 
ON S.id = G.student_id
WHERE G.gpa >
(
SELECT AVG(gpa)
FROM grade
) 
) AS temp;