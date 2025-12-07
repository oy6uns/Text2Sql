SELECT DISTINCT b.name
FROM Boats b
JOIN Reserves r ON b.bid = r.bid
JOIN Sailors s ON r.sid = s.sid
WHERE s.age BETWEEN 20 AND 30;
