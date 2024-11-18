SELECT
	r.start_point,
	r.end_point,
	r.leader_id,
	CONCAT_WS(' ', c.first_name, c.last_name) as leader_name
FROM
	routes as r
	INNER JOIN campers as c on c.id = r.leader_id