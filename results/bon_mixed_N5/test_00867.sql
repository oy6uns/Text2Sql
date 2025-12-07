SELECT s.sid, s.name
FROM Sailors s
WHERE s.sid IN (
    SELECT r1.sid
    FROM Reserves r1
    JOIN Boats b1 ON r1.bid = b1.bid
    WHERE b1.color = 'red'
)
AND s.sid IN (
    SELECT r2.sid
    FROM Reserves r2
    JOIN Boats b2 ON r2.bid = b2.bid
    WHERE b2.color = 'blue'
);
