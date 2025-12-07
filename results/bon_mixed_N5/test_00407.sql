SELECT Type_of_powertrain
FROM Vehicles
GROUP BY Type_of_powertrain
ORDER BY COUNT(id) DESC
LIMIT 1;
