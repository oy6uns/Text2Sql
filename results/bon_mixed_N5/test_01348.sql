SELECT Driver_Name
FROM driver d
LEFT JOIN race r ON d.Driver_ID = r.Driver_ID
WHERE r.Driver_ID IS NULL;
