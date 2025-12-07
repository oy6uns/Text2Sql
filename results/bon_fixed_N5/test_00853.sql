SELECT DISTINCT sid FROM Sailors WHERE age > (SELECT MAX(age) FROM Sailors WHERE sid <> Sailors.sid)
