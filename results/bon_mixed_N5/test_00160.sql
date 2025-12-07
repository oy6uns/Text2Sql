SELECT Vehicle_ID
FROM vehicle_driver
GROUP BY Vehicle_ID
ORDER BY COUNT(*) ASC
LIMIT 1;
