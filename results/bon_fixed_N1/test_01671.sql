SELECT Founded
FROM institution
GROUP BY Founded
HAVING COUNT(*) > 1;
