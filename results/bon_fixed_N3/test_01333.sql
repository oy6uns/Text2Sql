SELECT d.Driver_Name, COUNT(r.Road) AS Number_of_Races
FROM driver d
LEFT JOIN race r ON d.Driver_ID = r.Driver_ID
GROUP BY d.Driver_Name
ORDER BY d.Driver_Name;
