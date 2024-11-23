CREATE OR REPLACE FUNCTION fn_return_towns()
RETURNs TABLE(existing_id int, existing_name varchar) AS
$$
    BEGIN
        RETURN QUERY (SELECT * FROM towns);
    END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_return_towns();