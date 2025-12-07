SELECT driver_count AS max_vehicles_driven, Driver_ID
FROM (
    SELECT Driver_ID, COUNT(DISTINCT Vehicle_ID) AS driver_count
    FROM vehicle_driver
    GROUP BY Driver_ID
) AS counts
WHERE driver_count = (
    SELECT MAX(driver_count)
    FROM (
        SELECT COUNT(DISTINCT Vehicle_ID) AS driver_count
        FROM vehicle_driver
        GROUP BY Driver_ID
    ) AS sub
)
