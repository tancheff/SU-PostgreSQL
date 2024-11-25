CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
RETURNS VARCHAR AS
$$
DECLARE
	full_name VARCHAR;
BEGIN
	SELECT
		INITCAP(CONCAT_WS(' ', first_name, last_name))
	INTO
		full_name;

	IF first_name IS NULL THEN
		full_name := INITCAP(last_name);
	ELSIF last_name IS NULL THEN
		full_name := INITCAP(first_name);
	END IF;
RETURN
	full_name;
END;
$$
LANGUAGE plpgsql;