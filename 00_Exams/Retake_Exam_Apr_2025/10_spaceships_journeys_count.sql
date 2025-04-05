CREATE OR REPLACE FUNCTION udf_spaceship_journeys_count(spaceship_name VARCHAR(60))
RETURNS INTEGER AS
$$
DECLARE
    journey_count INTEGER;
BEGIN
    SELECT
		COUNT(j.id)
		INTO journey_count
    FROM
		spaceships as s
    LEFT JOIN journeys as j
		ON s.id = j.spaceship_id
    WHERE
		s.name = spaceship_name;

    RETURN COALESCE(journey_count, 0);
END;
$$
LANGUAGE plpgsql;