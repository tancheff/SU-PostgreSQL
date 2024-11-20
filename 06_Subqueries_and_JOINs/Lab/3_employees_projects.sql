SELECT
	e.employee_id,
	CONCAT_WS(' ', first_name, last_name) AS full_name,
	ep.project_id,
	p.name AS project_name
FROM
	employees AS e
	LEFT JOIN employees_projects AS ep ON ep.employee_id = e.employee_id
	    LEFT JOIN projects AS p ON p.project_id = ep.project_id
WHERE
	ep.project_id = 1