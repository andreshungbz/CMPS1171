SELECT testing_function(101, 'Hello Akram');

CREATE OR REPLACE FUNCTION testing_function (
	-- parameters
	p_num NUMERIC, 
	p_msg TEXT
)
RETURNS TEXT
LANGUAGE 'plpgsql'
COST 100
VOLATILE
AS $BODY$
DECLARE
	v_return_msg TEXT;
BEGIN
	v_return_msg := p_msg || ' ' || p_num;
RETURN v_return_msg;
END;
$BODY$