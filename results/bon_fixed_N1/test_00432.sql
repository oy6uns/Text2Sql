SELECT v.name
FROM Vehicles v
JOIN Renting_history r ON v.id = r.vehicles_id
GROUP BY v.name
ORDER BY SUM(r.total_hours) DESC;
