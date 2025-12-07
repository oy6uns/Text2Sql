SELECT v.name, v.Type_of_powertrain
FROM Vehicles v
JOIN Renting_history rh ON v.id = rh.vehicles_id
WHERE rh.total_hours > 30;
