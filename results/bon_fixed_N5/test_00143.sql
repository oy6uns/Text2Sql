SELECT Affiliation, COUNT(*) AS number_of_city_channels
FROM city_channel
GROUP BY Affiliation;
