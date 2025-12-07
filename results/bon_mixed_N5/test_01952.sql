SELECT DISTINCT g.Developers
FROM game g
JOIN game_player gp ON g.Game_ID = gp.Game_ID
JOIN player p ON gp.Player_ID = p.Player_ID
WHERE p.College = 'Auburn';
