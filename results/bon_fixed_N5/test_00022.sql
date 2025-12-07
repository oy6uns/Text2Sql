SELECT c.Name
FROM club c
JOIN player p ON c.Club_ID = p.Club_ID
GROUP BY c.Name
ORDER BY AVG(p.Earnings) DESC;
