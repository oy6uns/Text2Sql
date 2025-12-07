SELECT V.name, SUM(R.total_hours) AS total_hours
FROM Renting_history R
JOIN Vehicles V ON R.vehicles_id = V.id
GROUP BY V.name
ORDER BY total_hours DESC;
