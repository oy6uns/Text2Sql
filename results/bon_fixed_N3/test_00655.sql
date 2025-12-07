SELECT DISTINCT m.Name
FROM member m
JOIN club_leader cl ON m.Member_ID = cl.Member_ID
WHERE cl.Year_Join < '2018'
