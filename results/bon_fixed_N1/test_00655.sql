SELECT DISTINCT m.Name
FROM member m
JOIN club_leader cl ON m.Member_ID = cl.Member_ID
WHERE CAST(cl.Year_Join AS INTEGER) < 2018;
