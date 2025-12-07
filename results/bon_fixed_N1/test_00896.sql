SELECT bid, COUNT(*) AS reservation_count
FROM Reserves
WHERE bid > 50
GROUP BY bid;
