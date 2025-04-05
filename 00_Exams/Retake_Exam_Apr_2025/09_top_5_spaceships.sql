SELECT
    s.name AS spaceship_name,
    COUNT(DISTINCT j.id) AS journeys_count,
    COUNT(DISTINCT a.colonist_id) AS colonists_count
FROM
    spaceships as s
JOIN
    journeys as j
	ON s.id = j.spaceship_id
LEFT JOIN
    assignments as a
	ON j.id = a.journey_id
GROUP BY
	s.name
ORDER BY
    journeys_count DESC,
    colonists_count DESC,
    spaceship_name ASC
LIMIT 5;