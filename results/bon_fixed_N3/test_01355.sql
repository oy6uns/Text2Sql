SELECT DISTINCT d.Driver_Name
FROM driver d
JOIN race r1 ON d.Driver_ID = r1.Driver_ID
JOIN race r2 ON d.Driver_ID = r2.Driver_ID
WHERE r1.Pole_Position = 'James Hinchcliffe'
  AND r2.Pole_Position = 'Carl Skerlong'
