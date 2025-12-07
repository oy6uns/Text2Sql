SELECT Winning_team, COUNT(*) AS Wins
FROM race
GROUP BY Winning_team
HAVING COUNT(*) > 1;
