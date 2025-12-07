SELECT DISTINCT d1.Driver_Name
FROM driver d1
JOIN race r1 ON d1.Driver_ID = r1.Driver_ID
JOIN race r2 ON d1.Driver_ID = r2.Driver_ID
WHERE r1.Pole_Position = 'James Hinchcliffe'
  AND r2.Pole_Position = 'Carl Skerlong'
