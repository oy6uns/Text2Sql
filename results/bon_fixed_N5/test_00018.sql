SELECT DISTINCT c.Name
FROM club c
JOIN player p ON c.Club_ID = p.Club_ID
WHERE p.Wins_count > 2;
