select
	id,
	last_name,
	identity
from
	colonists
where
	right(last_name, 1) = 's'
	AND
	identity LIKE '%00%'
order by
	last_name DESC,
	identity ASC;