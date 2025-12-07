SELECT c.id, c.name
FROM cyclist c
JOIN (
    SELECT cyclist_id
    FROM cyclists_own_bikes
    GROUP BY cyclist_id
    ORDER BY COUNT(bike_id) DESC
    LIMIT 1
) AS top_cyclist ON c.id = top_cyclist.cyclist_id;
