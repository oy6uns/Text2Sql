SELECT player.Name AS Player_Name, club.Name AS Club_Name
FROM player
JOIN club ON player.Club_ID = club.Club_ID;
