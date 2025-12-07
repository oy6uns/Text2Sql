SELECT Affiliation, COUNT(*) AS count_affiliation
FROM institution
GROUP BY Affiliation
ORDER BY count_affiliation DESC
LIMIT 1;
