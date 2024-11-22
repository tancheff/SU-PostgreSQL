CREATE OR REPLACE FUNCTION fn_full_name(varchar, varchar)
RETURNS varchar AS
$$
	DECLARE
		first_name ALIAS FOR $1;
		last_name ALIAS FOR $2;
		greeting varchar;
	BEGIN
		greeting := 'Hello, my name is';
		RETURN concat(greeting, ' ', $1, ' ', $2);
	END
$$
LANGUAGE plpgsql;


SELECT * FROM fn_full_name('John', 'Doe');

----------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_get_name_len(name varchar)
RETURNS int AS
$$
	BEGIN
		RETURN length(name);
	END
$$
LANGUAGE plpgsql;

SELECT * FROM fn_get_name_len('Johnny');