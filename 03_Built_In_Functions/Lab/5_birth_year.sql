SELECT
	first_name,
	last_name,
	date_part('year', born) as year
FROM
    authors;