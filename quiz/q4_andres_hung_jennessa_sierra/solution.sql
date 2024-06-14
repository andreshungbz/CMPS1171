DROP DATABASE IF EXISTS quiz4;
CREATE DATABASE quiz4;

DROP ROLE IF EXISTS quiz4;
CREATE ROLE quiz4 WITH LOGIN PASSWORD 'quiz4';

\c quiz4 postgres
GRANT ALL PRIVILEGES ON SCHEMA public TO quiz4;
\c quiz4 quiz4

DROP TABLE IF EXISTS book;
CREATE TABLE book (
    id serial PRIMARY KEY,
    title text NOT NULL,
    isbn text NOT NULL,    
    pages integer NOT NULL,  -- how many pages in the book
    pub_date date NOT NULL DEFAULT NOW()  -- automatically inserted by PostgreSQL
);

DROP TABLE IF EXISTS author;
CREATE TABLE author (
    id serial PRIMARY KEY,
    fname text NOT NULL,
    lname text NOT NULL
);

-- Add your insert statements here

-- 1

INSERT INTO book (title, isbn, pages, pub_date)
VALUES
('Database Processing', '123456789', 670, '2023-09-12'),
('A+ Computer Repair', '987654321', 505, '2022-10-11'),
('C++ How to Program', '997755331', 644, '2021-11-29'),
('Intro to Computer Science', '554632231', 893, '2021-01-01'),
('Learn PostgreSQL 16', '667785343', 430, '2023-12-07');

INSERT INTO author (fname, lname)
VALUES
('David', 'Kroenke'),
('Sally', 'Gates'),
('Jorge', 'Martinez'),
('George', 'Kalos'),
('Randall', 'Smith');

-- 2

CREATE OR REPLACE PROCEDURE insert_book(
    p_title TEXT,
    p_isbn TEXT,
    p_pages INTEGER
)
AS $$
BEGIN
    IF p_title IS NULL THEN
        RAISE EXCEPTION 'title parameter cannot be empty';
    END IF;

    IF p_isbn IS NULL THEN
        RAISE EXCEPTION 'isbn parameter cannot be empty';
    END IF;

    IF p_pages IS NULL THEN
        RAISE EXCEPTION 'pages parameter cannot be empty';
    END IF;

    INSERT INTO book (title, isbn, pages)
    VALUES (p_title, p_isbn, p_pages);
END;
$$ LANGUAGE plpgsql;

CALL insert_book('Testing Book', '448833992', 700);
CALL insert_book(NULL, '423232332', 200);

-- 3

CREATE OR REPLACE FUNCTION enter_author(
	p_fname TEXT,
	p_lname TEXT
)
RETURNS INT
AS $$
DECLARE
	r_author_id INT;
BEGIN
	IF p_fname IS NULL THEN
		RAISE EXCEPTION 'fname parameter cannot be empty';
	END IF;

	IF p_lname IS NULL THEN
		RAISE EXCEPTION 'lname parameter cannot be empty';
	END IF;

	INSERT INTO author (fname, lname)
	VALUES (p_fname, p_lname)
	RETURNING id INTO r_author_id;

	RETURN r_author_id;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM enter_author('Andres', 'Hung');

-- 4

CREATE TABLE author_logs(
	id_old INT,
	fname_old TEXT,
	lname_old TEXT
);

-- 5

-- trigger function
CREATE OR REPLACE FUNCTION log_author_delete_update()
RETURNS TRIGGER
AS $$
BEGIN
	INSERT INTO author_logs (id_old, fname_old, lname_old)
	VALUES (OLD.id, OLD.fname, OLD.lname);

	-- TG_OP or trigger operation can check which operation is being used
	IF TG_OP = 'DELETE' THEN
		-- need to return OLD record for delete operations so that it deletes
		RETURN OLD;
	ELSEIF TG_OP = 'UPDATE' THEN
		RETURN NEW;
	END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_author_delete_update
ON author;

-- trigger
CREATE TRIGGER trg_author_delete_update
BEFORE DELETE OR UPDATE
ON author
FOR EACH ROW
EXECUTE PROCEDURE log_author_delete_update();

-- testing
UPDATE author
SET fname = 'Daniel'
WHERE id = 1;

DELETE FROM author
WHERE id = 2;