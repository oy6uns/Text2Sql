SELECT d.Driver_Name, d.Age
FROM driver d
JOIN race r ON d.Driver_ID = r.Driver_ID
GROUP BY d.Driver_ID, d.Driver_Name, d.Age
HAVING COUNT(r.Road) >= 2;
