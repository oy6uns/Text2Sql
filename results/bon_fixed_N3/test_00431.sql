SELECT v.name, SUM(rh.total_hours) AS total_renting_hours
FROM Renting_history rh
JOIN Vehicles v ON rh.vehicles_id = v.id
GROUP BY v.name
ORDER BY total_renting_hours DESC;
