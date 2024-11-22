CREATE OR REPLACE FUNCTION fn_get_new_city_id(IN city_name varchar, OUT city_id int, OUT status int)
AS
$$
    BEGIN
        SELECT id FROM countries WHERE country_city_name = city_name INTO city_id;
        status := 100;
    END;

$$
LANGUAGE plpgsql;

SELECT fn_get_new_city_id('Sofia');

SELECT city_id, status FROM fn_get_new_city_id('London');