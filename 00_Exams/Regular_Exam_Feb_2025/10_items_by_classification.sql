CREATE OR REPLACE FUNCTION udf_classification_items_count(classification_name VARCHAR(30))
RETURNS TEXT AS
$$
DECLARE
   item_count INT;
BEGIN
	SELECT
		COUNT(*)
	INTO
		item_count
	FROM
		classifications as c
	JOIN
		items as i
	ON
		c.id = i.classification_id
	WHERE
		c.name LIKE classification_name;

	IF item_count > 0 THEN
		RETURN FORMAT('Found %s items.', item_count);
	ELSE
		RETURN 'No items found.';
	END IF;
END;
$$
LANGUAGE plpgsql;