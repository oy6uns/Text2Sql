SELECT Player_name FROM player p LEFT JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Player_ID IS NULL;
