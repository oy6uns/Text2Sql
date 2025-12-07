SELECT Affiliation, COUNT(*) AS count
FROM city_channel
GROUP BY Affiliation
ORDER BY count DESC
LIMIT 1;
