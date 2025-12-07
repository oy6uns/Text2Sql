SELECT c.Name, COUNT(p.Program_ID) AS program_count
FROM channel c
LEFT JOIN program p ON c.Channel_ID = p.Channel_ID
GROUP BY c.Name
ORDER BY c.Name;
