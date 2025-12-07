SELECT c.Name, c.Internet
FROM channel c
JOIN director_admin da ON c.Channel_ID = da.Channel_ID
GROUP BY c.Channel_ID, c.Name, c.Internet
ORDER BY COUNT(DISTINCT da.Director_ID) DESC
LIMIT 1;
