SELECT s.sid, s.name
FROM Sailors s
WHERE s.sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'red'
)
AND s.sid IN (
    SELECT r.sid
    FROM Reserves r
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'blue'
)
