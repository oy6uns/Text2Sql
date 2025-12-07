SELECT DISTINCT Reserves.sid
FROM Reserves
JOIN Boats ON Reserves.bid = Boats.bid
WHERE Boats.color IN ('red', 'blue')
