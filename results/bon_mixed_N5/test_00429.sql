SELECT v.name, v.Model_year
FROM Vehicles v
JOIN (
    SELECT vehicles_id, COUNT(*) AS rent_count
    FROM Renting_history
    GROUP BY vehicles_id
    ORDER BY rent_count DESC
    LIMIT 1
) rh ON v.id = rh.vehicles_id;
