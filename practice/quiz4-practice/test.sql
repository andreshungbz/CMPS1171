CREATE OR REPLACE FUNCTION check_salary()
RETURNS TRIGGER
AS $$
BEGIN
	IF (NEW.salary - OLD.salary) / OLD.salary >= 1 THEN
		RAISE 'The salary increment cannot be that high';
	END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_salary
BEFORE UPDATE
ON employees
FOR EACH ROW
EXECUTE PROCEDURE check_salary();

INSERT INTO employees(first_name, last_name, salary)
VALUES('John','Doe',100000);