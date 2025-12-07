SELECT Vehicle_ID
FROM vehicle_driver
GROUP BY Vehicle_ID
ORDER BY COUNT(Driver_ID)
LIMIT 1;
