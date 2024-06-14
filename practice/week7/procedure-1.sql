DROP TABLE IF EXISTS employee;
DROP PROCEDURE IF EXISTS employee_insert;

CREATE TABLE employee (
	emp_id INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	is_active BOOLEAN DEFAULT 'true',
	create_date TIMESTAMP DEFAULT NOW(),
	update_date TIMESTAMP
);

CREATE OR REPLACE PROCEDURE employee_insert (
	-- parameters
	p_emp_id INT,
	p_first_name VARCHAR(30),
	p_last_name VARCHAR(30)
)
AS $$
BEGIN

	-- parameter validation
	if p_emp_id IS NULL then
		RAISE EXCEPTION 'emp_id must have a value';
	end if;
	
	if p_first_name IS NULL then
		RAISE EXCEPTION 'first_name must have a value';
	end if;
	
	if p_last_name IS NULL then
		RAISE EXCEPTION 'last_name must have a value';
	end if;
	
	INSERT INTO employee(emp_id, first_name, last_name)
	VALUES (p_emp_id, p_first_name, p_last_name);

END;
$$ LANGUAGE plpgsql;

CALL employee_insert(1, 'software', 'nuggets');
CALL employee_insert(2, 'hardware', 'nuggets');
CALL employee_insert(3, 'firmware', 'nuggets');
CALL employee_insert(4, 'kernel', 'nuggets');
CALL employee_insert(5, 'system', 'nuggets');

SELECT * FROM employee;
