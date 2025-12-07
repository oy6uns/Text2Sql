SELECT DISTINCT d1.Driver_Name
FROM race r1
JOIN driver d1 ON r1.Driver_ID = d1.Driver_ID
WHERE r1.Pole_Position = 'James Hinchcliffe'
AND d1.Driver_ID IN (
    SELECT r2.Driver_ID
    FROM race r2
    WHERE r2.Pole_Position = 'Carl Skerlong'
)
