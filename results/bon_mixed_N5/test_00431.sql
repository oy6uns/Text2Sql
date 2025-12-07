SELECT v.name, SUM(rh.total_hours) AS total_renting_hours
FROM Vehicles v
JOIN Renting_history rh ON v.id = rh.vehicles_id
GROUP BY v.name
ORDER BY total_renting_hours DESC;
