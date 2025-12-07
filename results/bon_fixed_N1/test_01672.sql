SELECT Founded AS Year, COUNT(*) AS Number_of_Institutions
FROM institution
GROUP BY Founded
HAVING COUNT(*) > 1;
