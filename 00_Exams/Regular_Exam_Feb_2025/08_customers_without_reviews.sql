SELECT
	c.id as customer_id,
	CONCAT_WS(' ', c.first_name, c.last_name) as full_name,
	count(c.id) as total_orders,
	CASE
		WHEN loyalty_card is false THEN 'Regular Customer'
		ELSE 'Loyal Customer'
	END AS loyalty_status
FROM
	customers as c
FULL JOIN
	reviews as r
ON
	c.id = r.customer_id
FULL JOIN
	orders as o
ON
	c.id = o.customer_id
WHERE
	o.id is NOT NULL
		AND
	r.created_at is NULL
GROUP BY
	c.id
ORDER BY
	count(c.id) DESC,
	c.id ASC;