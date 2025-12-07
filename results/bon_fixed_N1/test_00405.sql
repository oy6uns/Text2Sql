SELECT Type_of_powertrain, COUNT(*) AS vehicle_count
FROM Vehicles
GROUP BY Type_of_powertrain;
