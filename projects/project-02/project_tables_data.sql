-- [CMPS1171-1] Introduction to Databases Project 2
-- Andres Hung & Jennessa Sierra
-- 2024/03/22

/* USAGE */

-- 1. Comment everything after DATABASE SETUP section.
-- 2. Run file as the postgres superuser in the postgres database.
-- 3. Manually log into project database as project user.
-- 4. Uncomment the rest of sections and comment the DATABASE SETUP section.
-- 5. Run file again to create the tables and populate with data.

/* DATABASE SETUP */

DROP DATABASE IF EXISTS project;
CREATE DATABASE project;

DROP ROLE IF EXISTS project;
CREATE ROLE project WITH LOGIN PASSWORD '#swordfish#';

-- psql@15+ only - grant privileges to project user as postgres superuser
\c project postgres
GRANT ALL PRIVILEGES ON SCHEMA public TO project;
\c project project

/* CREATE TABLES */

-- drop existing tables
DROP TABLE IF EXISTS districts CASCADE;
DROP TABLE IF EXISTS addresses CASCADE;
DROP TABLE IF EXISTS parent_student CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS parents CASCADE;
DROP TABLE IF EXISTS teachers CASCADE;
DROP TABLE IF EXISTS classrooms CASCADE;
DROP TABLE IF EXISTS buildings CASCADE;

-- BUILDINGS and CLASSROOMS

CREATE TABLE buildings (
    building_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    classroom_capacity INT NOT NULL
);

CREATE TABLE classrooms (
    classroom_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    student_capacity INT NOT NULL,
    building INT NOT NULL,
    FOREIGN KEY (building) REFERENCES buildings (building_id)
);

-- TEACHERS, PARENTS and STUDENTS

CREATE TABLE districts (
    name TEXT PRIMARY KEY
);

CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    address TEXT NOT NULL,
    district TEXT,
    FOREIGN KEY (district) REFERENCES districts (name)
);

CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('m', 'f', 'o')),
    salary NUMERIC(8, 2) NOT NULL,
    contact_phone TEXT NOT NULL UNIQUE,
    contact_email TEXT NOT NULL UNIQUE,
    address INT, -- assume one main address
    FOREIGN KEY (address) REFERENCES addresses (address_id)
);

-- parents table also include guardians
-- only one parent of student is needed for record, but can add more than one record
CREATE TABLE parents (
    parent_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('m', 'f', 'o')),
    profession TEXT NOT NULL,
    contact_phone TEXT NOT NULL UNIQUE,
    contact_email TEXT NOT NULL UNIQUE,
    address INT, -- assume one main address
    FOREIGN KEY (address) REFERENCES addresses (address_id)
);

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('m', 'f', 'o')),
    date_of_birth DATE NOT NULL,
    graduated DATE DEFAULT NULL, -- NULL value indicates student has not graduated yet
    address INT,
    classroom INT NOT NULL, -- a preschool student only belongs to one classroom
    FOREIGN KEY (address) REFERENCES addresses (address_id),
    FOREIGN KEY (classroom) REFERENCES classrooms (classroom_id)
);

-- linking table to indicate many-to-many relationship between students and parents
CREATE TABLE parent_student (
    parent_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (parent_id, student_id),
    FOREIGN KEY (parent_id) REFERENCES parents (parent_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

/* INSERT DATA */

INSERT INTO buildings (name, classroom_capacity)
VALUES
    ('George Price', 2),
    ('Manuel Esquivel', 2);

INSERT INTO classrooms (name, student_capacity, building)
VALUES
    ('Toucan', 30, 1),
    ('Tapir', 30, 1),
    ('Mahogany', 25, 2),
    ('Black Orchid', 25, 2);

INSERT INTO districts
VALUES
    ('Corozal'),
    ('Orange Walk'),
    ('Belize'),
    ('Cayo'),
    ('Stann Creek'),
    ('Dangriga');

INSERT INTO addresses (address, district)
VALUES
    -- some teachers travel for work
    ('78 Duality Blvd', 'Belize'),
    ('45 Cardinal Ave', 'Cayo'),
    ('12 Lion Ave', 'Belize'),
    ('19 Dragon Ln', 'Orange Walk'),
    ('65 Trio St', 'Cayo'),
    ('32 Forest Dr', 'Cayo'),
    ('15 Flowers St', 'Cayo'),
    ('29 Macal St', 'Cayo'),
    ('24 Macaw Ave', 'Cayo'),
    ('46 College Blvd', 'Cayo'),
    -- parent and students have same address
    ('26 Canada Hill St', 'Cayo'),
    ('45 Orange St', 'Cayo'),
    ('17 Hibiscus St', 'Cayo'),
    ('49 Unity Blvd', 'Cayo'),
    ('13 Toucan Ave', 'Cayo'),
    ('11 Power Ln', 'Cayo'),
    ('15 Trinity Blvd', 'Cayo'),
    ('19 Constitution Dr', 'Cayo');

INSERT INTO teachers (first_name, last_name, gender, salary, contact_phone, contact_email, address)
VALUES
    ('Kieran', 'Ryan', 'm', 2500.00, '555-2468', 'kryan@gmail.com', 1),
    ('David', 'Garcia', 'm', 2200.00, '555-1357', 'dgarcia@outlook.com', 2),
    ('Vernelle', 'Sylvester', 'f', 2200.00, '555-9630', 'vsylvester@gmail.com', 3),
    ('Amilcar', 'Umana', 'm', 2250.00, '555-7421', 'aumana@gmail.com', 4),
    ('Manuel', 'Medina', 'm', 2300.00, '555-8532', 'mmedina@yahoo.com', 5),
    ('Stephen', 'Sangster', 'm', 2000.00, '555-6974', 'ssangster@protonmail.com', 6),
    ('Josue', 'Ake', 'm', 2100.00, '555-3815', 'jake@icloud.com', 7),
    ('Apolonio', 'Aguilar', 'm', 2400.00, '555-2697', 'aaguilar@hotmail.com', 8),
    ('Steven', 'Lewis', 'm', 2350.00, '555-1548', 'slewis@gmail.com', 9),
    ('Giovanni', 'Pinelo', 'f', 2400.00, '555-9637', 'gpinelo@gmail.com', 10);

INSERT INTO parents (first_name, last_name, gender, profession, contact_phone, contact_email, address)
VALUES
    ('Jorge', 'Vasquez', 'm', 'Electrician', '555-1234', 'gamer123@gmail.com', 11),
    ('Alissa', 'Guerrero', 'f', 'Musician', '555-5678', 'aly$$aGee@gmail.com', 12),
    ('Thomas', 'Flowers', 'm', 'Construction Worker', '555-9012', 'thomasflowers@gmail.com', 13),
    ('Karen', 'Castillo', 'f', 'Secretary', '555-3456', 'karencastle@yahoo.com', 14),
    ('Frank', 'Brown', 'm', 'Accountant', '555-7890', 'bfrank@gmail.com', 15),
    ('Lisa', 'Reyes', 'f', 'Chemist', '555-2345', 'lisareyesbmp@gmail.com', 16),
    ('Josue', 'Garcia', 'm', 'Artist', '555-6789', 'garciabest444@gmail.com', 17),
    ('Janet', 'Garcia', 'f', 'Writer', '555-0123', 'janety@hotmail.com', 17),
    ('Albert', 'Neal', 'm', 'Retail Clerk', '555-4567', 'nealiobert@gmail.com', 18),
    ('Ruth', 'Neal', 'f', 'Consultant', '555-8901', 'ruthusher@gmail.com', 18);

INSERT INTO students (first_name, last_name, gender, date_of_birth, graduated, address, classroom)
VALUES
    ('Miguel', 'Vasquez', 'm', '2019-05-15', '2023-08-01', 11, 1),
    ('Maria', 'Guerrero', 'f', '2018-11-20', '2022-08-01', 12, 2),
    ('Michael', 'Flowers', 'm', '2021-03-10', NULL, 13, 3),
    ('Sandra', 'Castillo', 'f', '2020-09-25', NULL, 14, 4),
    ('David', 'Brown', 'm', '2022-07-01', NULL, 15, 1),
    ('Martha', 'Reyes', 'f', '2020-12-12', NULL, 16, 2),
    ('Daniel', 'Garcia', 'm', '2020-02-28', NULL, 17, 3),
    ('Olivia', 'Neal', 'f', '2021-06-18', NULL, 18, 4),
    ('Matthew', 'Neal', 'm', '2021-10-05', NULL, 18, 1),
    ('Sophia', 'Neal', 'f', '2021-08-22', NULL, 18, 2);

INSERT INTO parent_student (parent_id, student_id)
VALUES
    -- both parents can be listed, but only one is necessary
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 7),
    (9, 8), (9, 9), (9, 10),
    (10, 8), (10, 9), (10, 10);

/* DISPLAY ALL TABLES */

SELECT *
FROM buildings;

SELECT *
FROM classrooms;

SELECT *
FROM districts;

SELECT *
FROM addresses;

SELECT *
FROM teachers;

SELECT *
FROM parents;

SELECT *
FROM students;

SELECT *
FROM parent_student;

/* EXTRA */

CREATE OR REPLACE FUNCTION update_ps_address()
RETURNS TRIGGER
AS $$
DECLARE
    v_record RECORD;
BEGIN
    -- prevent recursion of triggers on parents and students
    IF pg_trigger_depth() > 2 THEN
        RETURN NEW;
    END IF;

    IF TG_TABLE_NAME = 'parents' THEN
        FOR v_record IN (
            SELECT DISTINCT PS.student_id
            FROM students S
            INNER JOIN parent_student PS USING (student_id)
            WHERE PS.parent_id = OLD.parent_id
        ) LOOP
            IF NEW.address IS NOT NULL AND NEW.address <> OLD.address THEN
                UPDATE students
                SET address = NEW.address
                WHERE student_id = v_record.student_id;

                RAISE NOTICE 'student id % address updated.', v_record.student_id;
            END IF;
        END LOOP;
    ELSEIF TG_TABLE_NAME = 'students' THEN
        FOR v_record IN (
            SELECT DISTINCT PS.parent_id
            FROM parents P
            INNER JOIN parent_student PS USING (parent_id)
            WHERE PS.student_id = OLD.student_id
        ) LOOP
            IF NEW.address IS NOT NULL AND NEW.address <> OLD.address THEN
                UPDATE parents
                SET address = NEW.address
                WHERE parent_id = v_record.parent_id;

                RAISE NOTICE 'parent id % address updated.', v_record.parent_id;
            END IF;
        END LOOP;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS update_p_address_trigger
ON parents;

CREATE TRIGGER update_p_address_trigger
AFTER UPDATE OF address
ON parents
FOR EACH ROW
EXECUTE PROCEDURE update_ps_address();

DROP TRIGGER IF EXISTS update_s_address_trigger
ON students;

CREATE TRIGGER update_s_address_trigger
AFTER UPDATE OF address
ON students
FOR EACH ROW
EXECUTE PROCEDURE update_ps_address();

/*
SELECT *
FROM parents;

SELECT *
FROM students;

UPDATE parents
SET address = 11
WHERE parent_id = 9;

SELECT *
FROM parents;

SELECT *
FROM students;
*/