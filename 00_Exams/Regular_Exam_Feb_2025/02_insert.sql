INSERT INTO items (
	name,
	quantity,
	price,
	description,
	brand_id,
	classification_id
	)
SELECT
	CONCAT('Item', created_at) as name,
	customer_id as quantity,
	rating * 5 as price,
	NULL as description,
	item_id as brand_id,
	(SELECT MIN(item_id) from reviews) as classification_id
FROM
	reviews
ORDER BY
	item_id
LIMIT 10;