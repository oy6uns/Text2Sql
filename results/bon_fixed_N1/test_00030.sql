SELECT Country
FROM player
GROUP BY Country
HAVING COUNT(*) > 1;
