DROP TABLE IF EXISTS employee_v2;
DROP PROCEDURE IF EXISTS employee_v2_insert;

CREATE TABLE employee_v2 (
	emp_id SERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	is_active BOOLEAN DEFAULT 'true',
	create_date TIMESTAMP DEFAULT NOW(),
	update_date TIMESTAMP
);

CREATE OR REPLACE PROCEDURE employee_v2_insert (
	-- parameters
	p_first_name VARCHAR(30),
	p_last_name VARCHAR(30),
	-- returned parameter
	OUT rv_emp_id INTEGER
)
AS $$
BEGIN

	-- parameter validation
	if p_first_name IS NULL then
		RAISE EXCEPTION 'first_name must have a value';
	end if;
	
	if p_last_name IS NULL then
		RAISE EXCEPTION 'last_name must have a value';
	end if;
	
	INSERT INTO employee_v2(first_name, last_name)
	VALUES (p_first_name, p_last_name)
	RETURNING emp_id INTO rv_emp_id;

END;
$$ LANGUAGE plpgsql;

DO
$$
DECLARE
	v_emp_id INTEGER;
BEGIN
	CALL employee_v2_insert('sql', 'programmer', v_emp_id);
	RAISE NOTICE 'Emp_id = %', v_emp_id;
END;
$$