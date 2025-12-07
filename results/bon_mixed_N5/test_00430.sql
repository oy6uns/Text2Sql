SELECT V.name, V.Model_year
FROM Vehicles V
JOIN (
    SELECT vehicles_id, COUNT(*) AS rent_count
    FROM Renting_history
    GROUP BY vehicles_id
    ORDER BY rent_count DESC
    LIMIT 1
) AS Most_Rented ON V.id = Most_Rented.vehicles_id;
