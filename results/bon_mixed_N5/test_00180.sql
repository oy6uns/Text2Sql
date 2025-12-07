SELECT Vehicle_ID, Model
FROM vehicle
WHERE Builder = 'Ziyang'
OR Vehicle_ID IN (
    SELECT Vehicle_ID
    FROM vehicle_driver
    GROUP BY Vehicle_ID
    HAVING COUNT(DISTINCT Driver_ID) = 2
)
