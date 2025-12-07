SELECT d.Name
FROM director d
JOIN program p ON d.Director_ID = p.Director_ID
GROUP BY d.Director_ID, d.Name
ORDER BY COUNT(*) DESC
LIMIT 1;
