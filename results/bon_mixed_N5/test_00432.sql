SELECT v.name
FROM Vehicles v
JOIN (
    SELECT vehicles_id, SUM(total_hours) AS total_hours_sum
    FROM Renting_history
    GROUP BY vehicles_id
) rh ON v.id = rh.vehicles_id
ORDER BY rh.total_hours_sum DESC;
