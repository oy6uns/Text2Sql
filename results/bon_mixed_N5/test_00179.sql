SELECT DISTINCT v.Vehicle_ID, v.Model
FROM vehicle v
LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID
GROUP BY v.Vehicle_ID, v.Model, v.Builder
HAVING COUNT(DISTINCT vd.Driver_ID) >= 2 OR v.Builder = 'Ziyang'
