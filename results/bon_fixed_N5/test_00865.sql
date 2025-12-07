SELECT DISTINCT r1.sid
FROM Reserves r1
JOIN Boats b1 ON r1.bid = b1.bid
JOIN Reserves r2 ON r1.sid = r2.sid
JOIN Boats b2 ON r2.bid = b2.bid
WHERE b1.color = 'red' AND b2.color = 'blue'
