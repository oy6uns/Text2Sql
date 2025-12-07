SELECT Affiliation, COUNT(*) AS Number_of_City_Channels
FROM city_channel
GROUP BY Affiliation;
