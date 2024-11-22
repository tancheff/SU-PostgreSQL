CREATE OR REPLACE FUNCTION fn_get_city_id(city varchar)
RETURNS int AS
$$
	DECLARE
		city_id int;
	BEGIN
		SELECT city_id FROM countries WHERE city_name=city INTO city_id; -- така ст-та се напъхва в променливата
																		 -- city_id, която вечe сме декларирали
		RETURN city_id
	END;
$$
LANGUAGE plpgsql;


SELECT * FROM fn_get_city_id('Munich');


INSERT INTO
    employees(id, first_name, last_name, city_id, department)
VALUES
    (100, 'Lukas', 'Muller', fn_get_city_id('Berlin'), 'Biotech');

SELECT  * FROM employees
ORDER BY id DESC
LIMIT 1;