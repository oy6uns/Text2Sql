SELECT Country
FROM player
GROUP BY Country
HAVING COUNT(Player_ID) > 1;
