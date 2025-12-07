SELECT DISTINCT v1.Type_of_powertrain
FROM Vehicles v1
JOIN Vehicles v2 ON v1.Type_of_powertrain = v2.Type_of_powertrain
WHERE v1.Model_year = 2013
  AND v2.Model_year = 2014;
