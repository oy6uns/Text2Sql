SELECT v.name, v.Type_of_powertrain
FROM Vehicles v
JOIN Renting_history r ON v.id = r.vehicles_id
WHERE r.total_hours > 30;
