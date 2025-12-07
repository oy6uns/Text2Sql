SELECT Vehicle.Vehicle_ID, Vehicle.Model
FROM Vehicle
LEFT JOIN vehicle_driver ON Vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID
GROUP BY Vehicle.Vehicle_ID, Vehicle.Model, Vehicle.Builder
HAVING COUNT(DISTINCT vehicle_driver.Driver_ID) = 2 OR Vehicle.Builder = 'Ziyang'
