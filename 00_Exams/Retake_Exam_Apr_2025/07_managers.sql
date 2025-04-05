SELECT
    concat_ws(' ', c.first_name, c.last_name) as full_name,
    c.identity,
    concat('Manager/', a.journey_id) as role
FROM
    colonists as c
JOIN
    assignments as a
	ON c.id = a.colonist_id
WHERE
    a.task = 'Management'
ORDER BY
    role DESC,
    c.identity ASC;