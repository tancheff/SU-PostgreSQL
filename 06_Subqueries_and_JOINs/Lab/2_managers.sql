SELECT
	d.manager_id AS employee_id,
	CONCAT_WS(' ', first_name, last_name) AS full_name,
	d.department_id,
	d.name
FROM
	departments AS d
	LEFT JOIN employees AS e ON e.employee_id = d.manager_id
ORDER BY
	employee_id
limit
	5;