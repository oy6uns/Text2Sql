SELECT d.Name, d.Age
FROM director d
JOIN program p ON d.Director_ID = p.Director_ID
GROUP BY d.Director_ID, d.Name, d.Age
ORDER BY COUNT(*) DESC
LIMIT 1;
