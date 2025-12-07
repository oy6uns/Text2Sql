SELECT Manufacturer, COUNT(DISTINCT Club_ID) AS Number_of_Clubs
FROM club
GROUP BY Manufacturer;
