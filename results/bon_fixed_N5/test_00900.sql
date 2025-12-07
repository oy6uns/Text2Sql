SELECT Boats.name, COUNT(*) AS reservation_count
FROM Reserves
JOIN Boats ON Reserves.bid = Boats.bid
WHERE Reserves.sid > 1
GROUP BY Boats.name;
