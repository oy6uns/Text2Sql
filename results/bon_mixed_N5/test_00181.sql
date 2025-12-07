SELECT Vehicle_ID, Model
FROM vehicle
WHERE Vehicle_ID IN (
    SELECT Vehicle_ID
    FROM vehicle_driver
    GROUP BY Vehicle_ID
    HAVING COUNT(DISTINCT Driver_ID) > 2
    UNION
    SELECT vd.Vehicle_ID
    FROM vehicle_driver vd
    JOIN driver d ON vd.Driver_ID = d.Driver_ID
    WHERE d.Name = 'Jeff Gordon'
)
