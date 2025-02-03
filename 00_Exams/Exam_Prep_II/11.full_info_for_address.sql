CREATE TABLE IF NOT EXISTS search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(
	address_name VARCHAR(100)
) 
AS
$$
BEGIN
	TRUNCATE search_results;
	
	INSERT INTO search_results (
		address_name,
		full_name,
		level_of_bill,
		make,
		condition,
		category_name
	)
	SELECT
		address_name,
		cl.full_name,
		CASE
			WHEN co.bill <= 20 THEN 'Low'
			WHEN co.bill <= 30 THEN 'Medium' 
			ELSE 'High'
		END, 
		cr.make,
		cr.condition,
		ca.name
	FROM
		addresses AS a
	JOIN
		courses AS co
	ON
		a.id = co.from_address_id
	JOIN
		cars AS cr
	ON
		co.car_id = cr.id
	JOIN
		categories AS ca
	ON
		ca.id = cr.category_id
	JOIN
		clients AS cl
	ON
		cl.id = co.client_id
	WHERE
		a.name = address_name
	ORDER BY
		cr.make,
		cl.full_name;
END;
$$
LANGUAGE plpgsql;
-----------------------------------------------
CALL sp_courses_by_address('700 Monterey Avenue');
SELECT * FROM search_results;
-----------------------------------------------
SELECT
	a.name as address_name,
	cl.full_name,
	cour.bill,
	CASE
		WHEN cour.bill <= 20 THEN 'Low'
		WHEN cour.bill <= 30 THEN 'Medium'
		ELSE 'High'
	END AS level_of_bill,
	c.make,
	c.condition,
	cat.name as category_name
FROM
	courses as cour
JOIN
	addresses as a
ON
	cour.from_address_id = a.id
JOIN
	clients as cl
ON
	cl.id = cour.client_id
JOIN
	cars as c
ON
	c.id = cour.car_id
JOIN
	categories as cat
ON
	cat.id = c.category_id
WHERE
	a.name = '700 Monterey Avenue'
ORDER BY
	c.make,
	cl.full_name;
-----------------------------------------------
