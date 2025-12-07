SELECT COUNT(DISTINCT vd.Driver_ID)
FROM vehicle_driver vd
JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID
WHERE v.Build_Year = '2012';
