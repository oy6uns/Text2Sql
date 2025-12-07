SELECT v.name, SUM(r.total_hours) AS total_renting_hours
FROM Renting_history r
JOIN Vehicles v ON r.vehicles_id = v.id
GROUP BY v.name
ORDER BY total_renting_hours DESC;
