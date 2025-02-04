SELECT
	id,
	last_name,
	loyalty_card
FROM
	customers
WHERE
	(last_name ~* '[m]') is TRUE
		AND
	loyalty_card is TRUE
ORDER BY
	last_name DESC,
	id ASC;