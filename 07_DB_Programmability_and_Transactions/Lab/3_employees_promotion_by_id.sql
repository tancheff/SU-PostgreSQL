CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(current_id INT) AS
$$
	BEGIN
		UPDATE	employees
		SET salary = salary * 1.05
		WHERE employee_id = current_id;
	END;
$$
LANGUAGE plpgsql;
----------------------------------------
select * from employees;
----------------------------------------
CALL sp_increase_salary_by_id(1);
----------------------------------------