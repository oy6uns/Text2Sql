SELECT Affiliation, COUNT(ID) AS Number_of_City_Channels
FROM city_channel
GROUP BY Affiliation
ORDER BY Number_of_City_Channels DESC;
