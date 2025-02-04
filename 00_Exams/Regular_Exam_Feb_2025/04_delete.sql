DELETE FROM
	customers
WHERE
	id in (SELECT
		c.id
	FROM
		customers as c
	FULL JOIN
		orders as o
	ON
		c.id = o.customer_id
	WHERE
		o.id is NULL
);