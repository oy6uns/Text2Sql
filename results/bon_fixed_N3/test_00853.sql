SELECT DISTINCT s1.sid
FROM Sailors s1
WHERE s1.age > ALL (SELECT s2.age FROM Sailors s2 WHERE s2.sid <> s1.sid)
