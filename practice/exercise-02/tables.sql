DROP TABLE IF EXISTS employees;

CREATE TABLE
    employees (
        employee_id SERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        job TEXT NOT NULL,
        salary INT NOT NULL
    );

INSERT INTO
    employees (name, job, salary)
VALUES
    ('Andres Hung', 'Web Developer', 10000),
    ('Jennessa Sierra', 'Software Engineer', 20000),
    ('Greg Ack', 'Lab Technician', 15000),
    ('Mai Tex', 'Teacher', 8000),
    ('Jeff Khol', 'Mechanic', 10000);

SELECT
    *
FROM
    employees
ORDER BY
    name DESC;