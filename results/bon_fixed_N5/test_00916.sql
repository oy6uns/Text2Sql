SELECT DISTINCT Sailors.name
FROM Sailors
JOIN Reserves ON Sailors.sid = Reserves.sid
JOIN Boats ON Reserves.bid = Boats.bid
WHERE Boats.name = 'Melon';
