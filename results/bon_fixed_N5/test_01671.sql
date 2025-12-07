SELECT Founded AS Year
FROM institution
GROUP BY Founded
HAVING COUNT(*) > 1;
