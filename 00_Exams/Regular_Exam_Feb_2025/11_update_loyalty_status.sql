CREATE OR REPLACE PROCEDURE udp_update_loyalty_status(
	min_orders INT
)
AS
$$
BEGIN
	UPDATE
		customers
	SET
		loyalty_card = true
	WHERE id IN (
		SELECT
			c.id
		FROM
			customers as c
		JOIN
			orders as o
		ON
			o.customer_id = c.id
		GROUP BY
			c.id
		HAVING
			count(o.id) >= min_orders
	);
END;
$$
LANGUAGE plpgsql;