SELECT
	department_id,
	count(id) as employee_count
FROM
	employees
GROUP BY
	department_id
ORDER BY
	department_id;