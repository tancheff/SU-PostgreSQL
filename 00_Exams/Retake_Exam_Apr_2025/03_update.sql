UPDATE
	journeys
SET purpose =
	CASE
		WHEN purpose = 'Military' THEN 'Civil'
		WHEN purpose = 'Civil' THEN 'Military'
	END;