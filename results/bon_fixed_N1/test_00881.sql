SELECT DISTINCT s.sid, s.name
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE s.rating > 2;
