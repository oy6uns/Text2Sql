SELECT Affiliation, COUNT(*) AS Affiliation_Count
FROM institution
GROUP BY Affiliation
ORDER BY Affiliation_Count DESC
LIMIT 1;
