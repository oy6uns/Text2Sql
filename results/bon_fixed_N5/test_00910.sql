SELECT DISTINCT Boats.name
FROM Boats
JOIN Reserves ON Boats.bid = Reserves.bid
JOIN Sailors ON Reserves.sid = Sailors.sid
WHERE Sailors.age BETWEEN 20 AND 30;
