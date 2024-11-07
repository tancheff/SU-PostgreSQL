CREATE VIEW top_paid_employee
AS
SELECT
    *
FROM
    employees
ORDER BY salary DESC
LIMIT 1;


-- another option to get the top paid employee with a sub-query:


CREATE VIEW top_paid_employee
AS
SELECT
    *
FROM
    employees
WHERE
    salary = (SELECT MAX(salary) FROM employees);