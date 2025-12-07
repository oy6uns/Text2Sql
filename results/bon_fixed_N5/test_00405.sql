SELECT Type_of_powertrain, COUNT(*) AS number_of_vehicles
FROM Vehicles
GROUP BY Type_of_powertrain;
