SELECT AVG(m.Age) AS average_age
FROM member m
JOIN club_leader cl ON m.Member_ID = cl.Member_ID;
