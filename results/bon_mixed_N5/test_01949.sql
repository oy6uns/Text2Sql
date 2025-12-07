SELECT p.Player_name, p.Rank_of_the_year
FROM player p
JOIN game_player gp ON p.Player_ID = gp.Player_ID
JOIN game g ON gp.Game_ID = g.Game_ID
WHERE g.Title = 'Super Mario World';
