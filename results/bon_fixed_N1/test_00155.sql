SELECT Driver_ID, COUNT(Vehicle_ID) AS Vehicle_Count
FROM vehicle_driver
GROUP BY Driver_ID
ORDER BY Vehicle_Count DESC
LIMIT 1;
