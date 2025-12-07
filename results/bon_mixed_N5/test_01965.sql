SELECT Player_name FROM player LEFT JOIN game_player ON player.Player_ID = game_player.Player_ID WHERE game_player.Player_ID IS NULL;
