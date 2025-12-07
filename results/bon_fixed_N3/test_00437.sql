SELECT 
  Type_of_powertrain, 
  AVG(City_fuel_economy_rate) AS avg_city_fuel_rate, 
  AVG(Highway_fuel_economy_rate) AS avg_highway_fuel_rate
FROM Vehicles
GROUP BY Type_of_powertrain;
