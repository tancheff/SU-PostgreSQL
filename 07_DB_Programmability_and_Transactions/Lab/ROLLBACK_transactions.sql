BEGIN;
INSERT INTO
	towns(id, name)
VALUES
	(35, 'Blagoevgrad');
ROLLBACK;    -- така се връща предишното състояние на базата
             -- преди изпълняването на заявката
-----------------------------------------
select * from towns;
-----------------------------------------
CREATE TABLE bank(
	id INT PRIMARY KEY,
	name VARCHAR,
	amount INT
	);

INSERT INTO
	bank (id, name, amount)
VALUES
	(1, 'Miro', 1000),
	(2, 'Elena', 800);
-----------------------------------------
select * from bank;
-----------------------------------------
CREATE OR REPLACE PROCEDURE sp_transfer_money(
	IN sender_id INT,
	IN receiver_id INT,
	IN transfer_amount INT,
	OUT status VARCHAR(30)
)
AS
$$
	DECLARE
		sender_amount INT;
		receiver_amount INT;
		temp_val INT;
	BEGIN
		SELECT amount from bank WHERE id = sender_id
		INTO sender_amount;
		IF sender_amount < transfer_amount then
			status := 'Not enough money';
			RETURN;
		END IF;

		SELECT amount from bank WHERE id = receiver_id INTO receiver_amount;
		UPDATE bank SET amount = amount - transfer_amount WHERE id = sender_id;
		UPDATE bank SET amount = amount + transfer_amount WHERE id = receiver_id;

		SELECT amount FROM bank WHERE id = sender_id INTO temp_val;
		IF sender_amount - tranfer_amount <> temp_val THEN
			status := 'Error in sender';
			ROLLBACK;
			RETURN;
		END IF;

		SELECT amount from bank WHERE id = receiver_id INTO temp_val;
		IF receiver_amount + transfer_amount <> temp_val THEN
			status := 'Error in receiver';
			ROLLBACK;
			RETURN;
		END IF;

		status := 'Money transferred';
		COMMIT;
	END;
$$
LANGUAGE plpgsql;
-----------------------------------------
CALL sp_transfer_money(1, 2, 400, NULL);
-----------------------------------------
select * from bank;
-----------------------------------------