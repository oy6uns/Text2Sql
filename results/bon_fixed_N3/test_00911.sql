SELECT name
FROM Sailors
WHERE rating > ALL (
    SELECT S2.rating
    FROM Sailors S2
    JOIN Reserves R ON S2.sid = R.sid
    JOIN Boats B ON R.bid = B.bid
    WHERE B.color = 'red'
)
