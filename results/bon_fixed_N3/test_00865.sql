SELECT DISTINCT s1.sid
FROM Reserves s1
JOIN Boats b1 ON s1.bid = b1.bid
JOIN Reserves s2 ON s1.sid = s2.sid
JOIN Boats b2 ON s2.bid = b2.bid
WHERE b1.color = 'red' AND b2.color = 'blue';
