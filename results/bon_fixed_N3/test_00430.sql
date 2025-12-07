SELECT V.name, V.Model_year
FROM Vehicles V
JOIN Renting_history R ON V.id = R.vehicles_id
GROUP BY V.id, V.name, V.Model_year
ORDER BY COUNT(*) DESC
LIMIT 1;
