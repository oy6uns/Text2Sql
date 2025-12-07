SELECT Winning_team
FROM race
WHERE Winning_team IS NOT NULL
GROUP BY Winning_team
HAVING COUNT(*) > 1;
