SELECT COUNT(*) 
FROM driver d
WHERE NOT EXISTS (
  SELECT 1 
  FROM vehicle_driver vd 
  WHERE vd.Driver_ID = d.Driver_ID
)
