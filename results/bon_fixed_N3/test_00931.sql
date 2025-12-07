SELECT Earpads, COUNT(*) AS usage_count
FROM headphone
GROUP BY Earpads
ORDER BY usage_count DESC
LIMIT 2;
