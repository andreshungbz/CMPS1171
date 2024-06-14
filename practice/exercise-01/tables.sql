CREATE TABLE Payroll (
    userID SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    job TEXT NOT NULL,
    SALARY INT NOT NULL
);

INSERT INTO Payroll (name, job, salary)
VALUES
    ('Andres Hung', 'student', 10000),
    ('Packet Roo', 'artist', 20000);

SELECT *
FROM Payroll;