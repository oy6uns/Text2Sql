SELECT cyclist.id, COUNT(cyclists_own_bikes.bike_id) AS bike_count
FROM cyclist
LEFT JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id
GROUP BY cyclist.id
ORDER BY cyclist.id;
