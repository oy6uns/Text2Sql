SELECT t.Manager, t.Sponsor
FROM team t
JOIN team_driver td ON t.Team_ID = td.Team_ID
GROUP BY t.Team_ID, t.Manager, t.Sponsor
ORDER BY COUNT(td.Driver_ID) DESC
LIMIT 1;
