SELECT venue, year
FROM Paper
GROUP BY venue, year
ORDER BY COUNT(*) DESC
LIMIT 1;
