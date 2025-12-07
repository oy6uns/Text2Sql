SELECT Model 
FROM vehicle v
WHERE NOT EXISTS (
    SELECT 1 
    FROM vehicle_driver vd 
    WHERE vd.Vehicle_ID = v.Vehicle_ID
)
