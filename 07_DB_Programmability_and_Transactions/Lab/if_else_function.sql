CREATE OR REPLACE FUNCTION fn_full_name(first_name varchar, last_name varchar)
RETURNS varchar AS
$$
	DECLARE
        full_name varchar(30);
	BEGIN
	    IF first_name is NULL and last_name is NULL THEN
	        full_name := NULL;
	    ELSIF first_name is NULL THEN
	        full_name := last_name;
	    ELSIF last_name is NULL THEN
	        full_name := first_name;
	    ELSE
	        full_name := concat(first_name, ' ', last_name);
	    END IF;

	    RETURN full_name;
	END
$$
LANGUAGE plpgsql;


SELECT * FROM fn_full_name('John', NULL);