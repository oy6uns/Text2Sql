SELECT Reserves.bid, COUNT(*) AS reservation_count
FROM Reserves
WHERE Reserves.bid > 50
GROUP BY Reserves.bid;
