DELETE FROM colonists
WHERE identity in (
    SELECT
        c.identity
    FROM
        colonists as c
        LEFT JOIN assignments as a
        ON c.id = a.colonist_id
    WHERE
        a.journey_id is NULL
);