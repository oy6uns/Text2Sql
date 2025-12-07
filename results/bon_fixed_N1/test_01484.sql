SELECT c.name, c.nation, c.result
FROM cyclist c
WHERE c.id NOT IN (
    SELECT cyclist_id
    FROM cyclists_own_bikes cob
    JOIN bike b ON cob.bike_id = b.id
    WHERE b.material = 'racing'
);
