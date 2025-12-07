SELECT s.name
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
WHERE r.bid = 102;
