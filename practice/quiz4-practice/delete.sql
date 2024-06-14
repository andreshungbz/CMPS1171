CREATE TABLE students(
	roll NUMERIC(10),
	name VARCHAR(30),
	course VARCHAR(30)
);

CREATE TABLE students_logs(
	roll_old NUMERIC(10),
	name_old VARCHAR(30),
	course_old VARCHAR(30)
);

CREATE OR REPLACE FUNCTION student_logs_trg_func()
RETURNS TRIGGER
AS $$
BEGIN
	INSERT INTO students_logs(roll_old, name_old, course_old)
	VALUES (OLD.roll, OLD.name, OLD.course);

	IF TG_OP = 'DELETE' THEN
		RETURN OLD;
	ELSEIF TG_OP = 'UPDATE' THEN
		RETURN NEW;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER student_trg
BEFORE DELETE OR UPDATE
ON students
FOR EACH ROW
EXECUTE PROCEDURE student_logs_trg_func();

DROP TRIGGER student_trg
ON students;

INSERT INTO students
VALUES (1, 'Akram', 'MCA');

SELECT * FROM students;
SELECT * FROM students_logs;

UPDATE students
SET name = 'Akram EPIC'
WHERE roll = 1;

DELETE FROM students
WHERE roll = 1;