SELECT Name 
FROM member 
WHERE Member_ID NOT IN (SELECT DISTINCT Member_ID FROM club_leader);
