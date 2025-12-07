SELECT g.Title
FROM game g
WHERE NOT EXISTS (
    SELECT 1
    FROM game_player gp
    JOIN player p ON gp.Player_ID = p.Player_ID
    WHERE gp.Game_ID = g.Game_ID
      AND p.Position = 'Guard'
);
