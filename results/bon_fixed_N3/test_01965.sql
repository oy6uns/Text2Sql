SELECT Player_name
FROM player
WHERE Player_ID NOT IN (SELECT DISTINCT Player_ID FROM game_player);
