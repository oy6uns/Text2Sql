SELECT Boats.bid, COUNT(Reserves.sid) AS reservation_count
FROM Boats
LEFT JOIN Reserves ON Boats.bid = Reserves.bid
WHERE Boats.bid > 50
GROUP BY Boats.bid;
