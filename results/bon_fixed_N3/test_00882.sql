SELECT DISTINCT s.name, s.sid
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE s.rating >= 3;
