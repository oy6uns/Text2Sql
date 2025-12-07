SELECT COUNT(*) 
FROM driver d
LEFT JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID
WHERE vd.Vehicle_ID IS NULL;
