SELECT Franchise
FROM game
GROUP BY Franchise
HAVING COUNT(Game_ID) >= 2;
