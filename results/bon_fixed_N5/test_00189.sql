SELECT d.Name, d.Citizenship
FROM driver d
JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID
JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID
WHERE v.Model = 'DJ1'
