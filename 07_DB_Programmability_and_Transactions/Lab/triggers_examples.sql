CREATE TABLE items(
	id SERIAL PRIMARY KEY,
	status int,
	created date
);
----------------------------------------
CREATE TABLE items_log(
	id SERIAL PRIMARY KEY,
	status int,
	created date
);
----------------------------------------
CREATE FUNCTION log_items()
RETURNS TRIGGER AS
$$
	BEGIN
		INSERT INTO
			items_log(status, created)
		VALUES
			(new.status, new.created);
		RETURN
			new;
	END;
$$
LANGUAGE plpgsql;
----------------------------------------
CREATE TRIGGER log_items_trigger
AFTER INSERT on items
FOR EACH ROW
EXECUTE PROCEDURE log_items();
----------------------------------------
INSERT INTO
	items(status, created)
VALUES
	(1, now()),
	(2, now()),
	(3, now()),
	(4, now()),
	(5, now()),
	(6, now());
----------------------------------------
select * from items;
----------------------------------------
select * from items_log;
----------------------------------------
-- create a trigger to delete oldest data from items_log when rows > 10

CREATE OR REPLACE FUNCTION delete_last_items_log()
RETURNS TRIGGER AS
$$
	BEGIN
		WHILE (SELECT count(*) FROM items_log) > 10 LOOP
			DELETE FROM items_log WHERE id=(SELECT MIN(id) FROM items_log);
		END LOOP;
		RETURN new;
	END;
$$
LANGUAGE plpgsql;
----------------------------------------
CREATE OR REPLACE TRIGGER clear_items_log_trigger
AFTER INSERT ON items_log
FOR EACH STATEMENT
EXECUTE PROCEDURE delete_last_items_log();
----------------------------------------
INSERT INTO
	items(status, created)
VALUES
	(7, now()),
	(8, now()),
	(9, now()),
	(10, now()),
	(11, now()),
	(12, now()),
	(13, now()),
	(14, now()),
	(15, now());
----------------------------------------
select * from items_log;

-- id-тата в таблица items_log растат, но никога няма повече от 10 записа;
-- т.е. items_log държи последните 10 записа на items в себе си