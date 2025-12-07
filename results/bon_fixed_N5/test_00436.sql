SELECT v.name, v.Type_of_powertrain
FROM Vehicles v
JOIN Renting_history r ON v.id = r.vehicles_id
GROUP BY v.id, v.name, v.Type_of_powertrain
HAVING SUM(r.total_hours) > 30;
