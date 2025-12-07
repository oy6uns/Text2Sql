SELECT Boats.bid, Boats.name, COUNT(Reserves.sid) AS reservation_count
FROM Boats
LEFT JOIN Reserves ON Boats.bid = Reserves.bid AND Reserves.sid > 1
GROUP BY Boats.bid, Boats.name
ORDER BY Boats.bid;
