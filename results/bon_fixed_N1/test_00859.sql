SELECT s.sid, s.name
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
GROUP BY s.sid, s.name
HAVING COUNT(DISTINCT r.bid) > 1;
