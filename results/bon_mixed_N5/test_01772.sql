SELECT state
FROM university
GROUP BY state
ORDER BY COUNT(University_ID) DESC
LIMIT 1;
