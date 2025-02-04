SELECT
	id,
	TO_CHAR(DATE(created_at), 'DD-MM-YYYY') as created_at,
	customer_id
FROM
	orders
WHERE
	customer_id BETWEEN 15 and 30
		AND
	created_at > '01-01-2025'
ORDER BY
	created_at ASC,
	customer_id DESC,
	id ASC
LIMIT
	5;