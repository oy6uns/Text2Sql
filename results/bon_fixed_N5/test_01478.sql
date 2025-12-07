SELECT c.id, c.name
FROM cyclist c
JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id
GROUP BY c.id, c.name
ORDER BY COUNT(cob.bike_id) DESC
LIMIT 1;
