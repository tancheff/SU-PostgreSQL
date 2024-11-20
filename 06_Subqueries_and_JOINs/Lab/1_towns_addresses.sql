SELECT
	a.town_id,
	t.name AS town_name,
	a.address_text
FROM
	addresses AS a
	LEFT JOIN towns AS t ON a.town_id=t.town_id
WHERE
	name IN ('Sofia', 'Carnation', 'San Francisco')
ORDER BY
	town_id,
	address_id;