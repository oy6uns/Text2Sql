SELECT Earpads, COUNT(*) AS headphone_count
FROM headphone
GROUP BY Earpads
ORDER BY headphone_count DESC
LIMIT 2;
