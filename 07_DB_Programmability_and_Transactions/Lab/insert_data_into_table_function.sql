CREATE OR REPLACE FUNCTION fn_insert_data(new_id INT, new_name VARCHAR)
RETURNS BOOLEAN AS
$$
    BEGIN
        INSERT INTO
            towns(town_id, name)
        VALUES
            (new_id, new_name);
        EXCEPTION
            WHEN UNIQUE_VIOLATION THEN RETURN FALSE; -- при повторение на PK
        RETURN
            TRUE;
    END;
$$
LANGUAGE plpgsql;

select fn_insert_data(33, 'Monaco');