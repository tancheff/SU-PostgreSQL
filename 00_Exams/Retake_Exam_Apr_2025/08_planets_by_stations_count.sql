SELECT
    'Planet: ' || p.name as planet_name,
    COUNT(s.id) as station_count,
    TRUNC(AVG(s.max_capacity)::numeric, 2) as avg_capacity
FROM
    planets as p
LEFT JOIN
    stations as s
    ON p.id = s.planet_id
GROUP BY
    p.name
ORDER BY
    station_count DESC,
    avg_capacity DESC,
    planet_name ASC;