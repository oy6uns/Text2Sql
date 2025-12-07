SELECT Model
FROM vehicle v
LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID
WHERE vd.Driver_ID IS NULL;
