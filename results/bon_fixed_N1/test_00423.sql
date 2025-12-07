SELECT v.name, SUM(rh.total_hours) AS total_hours
FROM Vehicles v
LEFT JOIN Renting_history rh ON v.id = rh.vehicles_id
GROUP BY v.name;
