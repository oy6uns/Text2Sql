SELECT Founded
FROM institution
WHERE Founded IS NOT NULL
GROUP BY Founded
HAVING COUNT(Institution_ID) > 1;
