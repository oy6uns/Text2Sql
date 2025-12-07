SELECT Winning_team
FROM race
GROUP BY Winning_team
HAVING COUNT(*) > 1;
