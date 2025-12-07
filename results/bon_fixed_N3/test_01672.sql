SELECT Founded AS Year, COUNT(*) AS Number_of_Institutions
FROM institution
WHERE Founded IS NOT NULL
GROUP BY Founded
HAVING COUNT(*) > 1
ORDER BY Founded;
