DROP TABLE IF EXISTS hr_employee;
CREATE TABLE hr_employee (
	emp_id INT NOT NULL,
	annual_salary NUMERIC NOT NULL,
	hourly_rate NUMERIC GENERATED ALWAYS AS (annual_salary / 2000) STORED
);

BEGIN TRANSACTION;

	INSERT INTO hr_employee(emp_id, annual_salary)
	VALUES
	(3, 70000),
	(4, 70000),
	(5, 70000),
	(6, 70000),
	(7, 70000),
	(3, 70000);
	
	SELECT * FROM hr_employee;
	
-- COMMIT;
-- ROLLBACK;

TRUNCATE TABLE hr_employee;

BEGIN TRANSACTION;

	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (1, 40000);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (2, 50000);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (3, 65000);
	SAVEPOINT emp_3;
	
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (4, 70000);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (5, 85000);
	UPDATE hr_employee SET annual_salary = 41000 WHERE emp_id = 1;
	SAVEPOINT emp_5;
	
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (6, 90000);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (7, 95000);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (8, 96000);
	DELETE FROM hr_employee WHERE emp_id = 2;
	SAVEPOINT emp_8;
	
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (9, 97000);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (10, 97500);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (11, 97700);
	INSERT INTO hr_employee(emp_id, annual_salary) VALUES (12, 97800);
	
	ROLLBACK TO SAVEPOINT emp_3;
	RELEASE SAVEPOINT emp_5;
	
	SELECT * FROM hr_employee;
	
-- COMMIT;
-- ROLLBACK;

SELECT pg_backend_pid();

SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'week8'
AND pid <> pg_backend_pid()
AND state = 'idle'
AND pid = 28789;

SELECT *
FROM hr_employee
WHERE emp_id = 1
ORDER BY emp_id;

SELECT pg_backend_pid();

BEGIN;

	UPDATE hr_employee
	SET annual_salary = 30000
	WHERE emp_id = 1;