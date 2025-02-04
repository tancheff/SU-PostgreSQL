SELECT
	i.name,
	CONCAT(UPPER(b.name), '/', LOWER(c.name)) as promotion,
	CONCAT('On sale: ', i.description),
	i.quantity
FROM
	orders_items as oi
FULL JOIN
	items as i
ON
	oi.item_id = i.id
JOIN
	brands as b
ON
	b.id = i.brand_id
JOIN
	classifications as c
ON
	c.id = i.classification_id
WHERE
	oi.order_id is NULL
ORDER BY
	i.quantity DESC,
	i.name ASC;