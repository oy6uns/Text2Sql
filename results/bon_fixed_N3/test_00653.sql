SELECT m.Name AS Leader_Name, c.Club_Name
FROM club_leader cl
JOIN member m ON cl.Member_ID = m.Member_ID
JOIN club c ON cl.Club_ID = c.Club_ID;
