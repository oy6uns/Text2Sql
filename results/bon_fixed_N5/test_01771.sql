SELECT State
FROM university
GROUP BY State
ORDER BY COUNT(University_ID) DESC
LIMIT 1;
