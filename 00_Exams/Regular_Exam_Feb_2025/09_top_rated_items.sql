SELECT
	i.name as item_name,
	ROUND(AVG(r.rating), 2) as average_rating,
	count(r.item_id) as total_reviews,
	b.name as brand_name,
	c.name as classification_name
FROM
	items as i
JOIN
	reviews as r
ON
	i.id = r.item_id
JOIN
	brands as b
ON
	b.id = i.brand_id
JOIN
	classifications as c
ON
	c.id = i.classification_id
GROUP BY
	i.name, b.name, c.name
HAVING
	count(r.item_id) >= 3
ORDER BY
	average_rating DESC,
	item_name ASC
LIMIT
	3;