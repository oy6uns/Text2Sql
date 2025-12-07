SELECT Class
FROM headphone
GROUP BY Class
HAVING COUNT(Headphone_ID) > 2;
