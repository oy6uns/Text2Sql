SELECT Driver_ID, COUNT(Vehicle_ID) AS Vehicle_Count
FROM vehicle_driver
GROUP BY Driver_ID
HAVING COUNT(Vehicle_ID) = (
    SELECT MAX(Vehicle_Count) FROM (
        SELECT COUNT(Vehicle_ID) AS Vehicle_Count
        FROM vehicle_driver
        GROUP BY Driver_ID
    ) AS counts
)
