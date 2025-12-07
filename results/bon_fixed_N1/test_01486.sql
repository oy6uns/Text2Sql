SELECT cyclist_id, COUNT(bike_id) AS bike_count
FROM cyclists_own_bikes
GROUP BY cyclist_id
ORDER BY cyclist_id;
