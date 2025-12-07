SELECT v.name, v.Model_year
FROM Vehicles v
JOIN Renting_history rh ON v.id = rh.vehicles_id
GROUP BY v.id, v.name, v.Model_year
ORDER BY COUNT(rh.id) DESC
LIMIT 1;
