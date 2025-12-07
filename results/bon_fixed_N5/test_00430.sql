SELECT v.name, v.Model_year
FROM Vehicles v
JOIN Renting_history r ON v.id = r.vehicles_id
GROUP BY v.id, v.name, v.Model_year
ORDER BY COUNT(r.id) DESC
LIMIT 1;
