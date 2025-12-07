SELECT name
FROM Sailors s1
WHERE rating > ALL (
    SELECT s2.rating
    FROM Sailors s2
    JOIN Reserves r ON s2.sid = r.sid
    JOIN Boats b ON r.bid = b.bid
    WHERE b.color = 'red'
)
