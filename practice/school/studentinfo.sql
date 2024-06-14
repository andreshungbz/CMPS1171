-- This is an example of a one-to-many relationship in a database
-- The one table (student) can have many rows in the many table (address)
-- A student can have many addresses.

-- This is the parent table
DROP TABLE IF EXISTS student CASCADE;
CREATE TABLE student (
  id serial PRIMARY KEY,
  first_name text,
  last_name text
);

-- This is the child table
DROP TABLE IF EXISTS address;
CREATE TABLE address (
    id serial PRIMARY KEY,
    name text,
    student_id integer REFERENCES student(id) ON DELETE CASCADE    -- student_id is the foreign key
);

-- Step #1: add data to the student table. Parent data must be added BEFORE child data
INSERT INTO student(first_name, last_name)
VALUES
('Jane', 'Smith'),    -- id is 1
('Jim', 'Smarts');     -- id is 2

-- Step #2: add data to the address table. Child data must be added AFTER parent data
INSERT INTO address(name, student_id)
VALUES
('#3 Apple Street', 1),    -- foreign key
('#8 Bird Avenue ', 1),    -- foreign key
('#44 Jump Street', 2);    -- foreign key

-- Get student information
SELECT S.first_name, S.last_name, A.name
FROM student AS S
INNER JOIN address AS A
ON S.id = A.student_id;

-- This is how we delete a row
--DELETE FROM student 
--WHERE id = 1;
