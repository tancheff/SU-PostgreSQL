CREATE OR REPLACE PROCEDURE udp_update_max_capacity(
    planet_name VARCHAR(60),
    increment INT
)
AS $$
BEGIN
    UPDATE stations as s
    SET max_capacity = max_capacity + increment
    FROM planets as p
    WHERE s.planet_id = p.id
    AND p.name = planet_name;

    IF NOT FOUND THEN
        RAISE NOTICE 'No stations found for planet %', planet_name;
    END IF;
END;
$$ LANGUAGE plpgsql;