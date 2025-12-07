SELECT Type_of_powertrain
FROM Vehicles
WHERE Model_year IN (2013, 2014)
GROUP BY Type_of_powertrain
HAVING COUNT(DISTINCT Model_year) = 2;
