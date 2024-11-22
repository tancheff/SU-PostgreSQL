UPDATE
	countries
SET
	country_name = 'Burma'
WHERE
	country_name = 'Myanmar';


INSERT INTO
	monasteries (monastery_name, country_code)
VALUES
	('Hanga Abbey', (
					select country_code from countries
					where country_name = 'Tanzania')
	),
	('Myin-Tin-Daik', (
					select country_code from countries
					where country_name = 'Myanmar')				
	);


SELECT
	ct.continent_name,
	c.country_name,
	COUNT(m.id) as monasteries_count
FROM
	countries as c
	LEFT JOIN monasteries as m ON c.country_code = m.country_code
	LEFT JOIN continents as ct ON ct.continent_code = c.continent_code
WHERE
	NOT three_rivers
GROUP BY
	c.country_name,
	ct.continent_name
ORDER BY
	monasteries_count DESC,
	country_name ASC;