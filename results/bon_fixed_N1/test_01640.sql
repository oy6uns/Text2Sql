SELECT t.Manager, t.Car_Owner
FROM team t
JOIN team_driver td ON t.Team_ID = td.Team_ID
GROUP BY t.Team_ID, t.Manager, t.Car_Owner
HAVING COUNT(td.Driver_ID) >= 2;
