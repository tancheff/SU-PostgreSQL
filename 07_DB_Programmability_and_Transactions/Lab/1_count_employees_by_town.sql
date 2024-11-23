CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar(20))
RETURNS INT AS
$$
	DECLARE
		num_of_employees INT;
	BEGIN
		SELECT
			count(e.employee_id)
		INTO num_of_employees
		FROM
			employees as e
			LEFT JOIN addresses as a ON e.address_id = a.address_id
			LEFT JOIN towns as t ON t.town_id = a.town_id
		WHERE t.name LIKE town_name;
		RETURN num_of_employees;
	END;
$$
LANGUAGE plpgsql;

SELECT fn_count_employees_by_town('Sofia');