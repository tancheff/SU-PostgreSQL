CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(current_id INT) AS
$$
	BEGIN
	    IF (SELECT salary FROM employees WHERE employee_id = current_id) IS NULL THEN
	        RETURN;
	    END IF;

		UPDATE	employees SET salary = salary * 1.05 WHERE employee_id = current_id;
		COMMIT;
	END;
$$
LANGUAGE plpgsql;
----------------------------------------
select * from employees;
----------------------------------------
CALL sp_increase_salary_by_id(1);
----------------------------------------