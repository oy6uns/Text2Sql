SELECT Franchise, COUNT(*) AS Number_of_Games
FROM game
GROUP BY Franchise;
