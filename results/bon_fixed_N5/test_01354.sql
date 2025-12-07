SELECT DISTINCT d1.Driver_Name
FROM race r1
JOIN driver d1 ON r1.Driver_ID = d1.Driver_ID
WHERE r1.Pole_Position = 'James Hinchcliffe'
AND d1.Driver_Name IN (
    SELECT d2.Driver_Name
    FROM race r2
    JOIN driver d2 ON r2.Driver_ID = d2.Driver_ID
    WHERE r2.Pole_Position = 'Carl Skerlong'
)
