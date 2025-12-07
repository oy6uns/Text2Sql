SELECT Winning_team, COUNT(*) AS wins
FROM race
GROUP BY Winning_team
HAVING COUNT(*) > 1;
