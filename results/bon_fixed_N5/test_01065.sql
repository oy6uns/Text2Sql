SELECT Location
FROM conference
GROUP BY Location
HAVING COUNT(DISTINCT Conference_ID) >= 2;
