SELECT
	v.driver_id,
	v.vehicle_type,
	CONCAT_WS(' ', c.first_name, c.last_name) as driver_name
FROM
	vehicles as v
	INNER JOIN campers as c on v.driver_id =  c.id;


-- without using JOIN:

SELECT
	v.driver_id,
	v.vehicle_type,
	CONCAT_WS(' ', c.first_name, c.last_name) as driver_name
FROM
	vehicles as v,
	campers as c
WHERE
	v.driver_id =  c.id;