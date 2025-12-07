SELECT v.name, v.Type_of_powertrain
FROM Vehicles v
JOIN (
    SELECT vehicles_id
    FROM Renting_history
    GROUP BY vehicles_id
    HAVING SUM(total_hours) > 30
) rh ON v.id = rh.vehicles_id
