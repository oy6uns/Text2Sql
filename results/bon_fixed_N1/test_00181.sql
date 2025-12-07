SELECT v.Vehicle_ID, v.Model
FROM vehicle v
JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID
JOIN driver d ON vd.Driver_ID = d.Driver_ID
GROUP BY v.Vehicle_ID, v.Model
HAVING COUNT(DISTINCT vd.Driver_ID) > 2
   OR MAX(CASE WHEN d.Name = 'Jeff Gordon' THEN 1 ELSE 0 END) = 1
