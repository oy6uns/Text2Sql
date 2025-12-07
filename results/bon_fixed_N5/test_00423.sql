SELECT v.name, SUM(r.total_hours) AS total_hours
FROM Vehicles v
LEFT JOIN Renting_history r ON v.id = r.vehicles_id
GROUP BY v.name;
