SELECT c.Name, c.Internet
FROM channel c
JOIN program p ON c.Channel_ID = p.Channel_ID
GROUP BY c.Channel_ID, c.Name, c.Internet
HAVING COUNT(p.Program_ID) > 1;
