INSERT INTO
	spaceships (name, manufacturer, speed)
SELECT
    CONCAT(REVERSE(last_name), identity) as name,
    CONCAT(UPPER(LEFT(first_name, 2)), date_part('month', birth_date)) as manufacturer,
    date_part('year', birth_date) + 100 as speed
FROM
    colonists
WHERE
    birth_date > '2001-01-01';