SELECT DISTINCT Sailors.name, Sailors.sid
FROM Sailors
JOIN Reserves ON Sailors.sid = Reserves.sid
JOIN Boats ON Reserves.bid = Boats.bid
WHERE Boats.color IN ('red', 'blue')
