SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS average_annual_fuel_cost
FROM Vehicles
GROUP BY Type_of_powertrain
HAVING COUNT(id) >= 2;
