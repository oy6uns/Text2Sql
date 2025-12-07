SELECT Class
FROM headphone
GROUP BY Class
HAVING COUNT(*) <= 2;
