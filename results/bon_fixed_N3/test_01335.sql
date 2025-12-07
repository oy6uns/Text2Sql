SELECT d.Age
FROM driver d
JOIN race r ON d.Driver_ID = r.Driver_ID
GROUP BY d.Driver_ID, d.Age
ORDER BY COUNT(r.Road) DESC
LIMIT 1;
