CREATE OR REPLACE FUNCTION fn_full_name(first_name varchar, last_name varchar)
RETURNS varchar AS
$$
	DECLARE
		full_name varchar;
	BEGIN
		SELECT CONCAT_WS(' ', first_name, last_name) INTO full_name;
		RETURN full_name;
	END;
$$
LANGUAGE plpgsql;

select fn_full_name('test', 'successful');