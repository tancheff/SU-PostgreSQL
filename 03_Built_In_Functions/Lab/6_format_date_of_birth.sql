SELECT
	last_name,
	TO_CHAR(born, 'DD (Dy) Mon YYYY') AS "Date of Birth"
FROM
	authors;