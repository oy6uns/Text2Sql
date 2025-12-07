SELECT Affiliation, COUNT(*) AS count_affiliation
FROM city_channel
GROUP BY Affiliation
ORDER BY count_affiliation DESC
LIMIT 1;
