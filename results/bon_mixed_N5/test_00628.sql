SELECT Nationality
FROM customer
GROUP BY Nationality
ORDER BY COUNT(*) DESC
LIMIT 1;
