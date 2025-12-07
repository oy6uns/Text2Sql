SELECT DISTINCT g.Title
FROM game g
JOIN game_player gp ON g.Game_ID = gp.Game_ID
JOIN player p ON gp.Player_ID = p.Player_ID
WHERE g.Game_ID IN (
    SELECT gp1.Game_ID
    FROM game_player gp1
    JOIN player p1 ON gp1.Player_ID = p1.Player_ID
    WHERE p1.College = 'Oklahoma'
)
AND g.Game_ID IN (
    SELECT gp2.Game_ID
    FROM game_player gp2
    JOIN player p2 ON gp2.Player_ID = p2.Player_ID
    WHERE p2.College = 'Auburn'
)
