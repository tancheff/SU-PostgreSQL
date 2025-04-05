SELECT
    id,
    TO_CHAR(start_time, 'DD-MM-YY HH24:MI') as start_time,
    station_id
FROM
    journeys
WHERE
    DATE(start_time) > DATE('2025-02-10')
    AND
    purpose = 'Civil'
ORDER BY
    start_time ASC,
    station_id ASC,
    id DESC
LIMIT 3;