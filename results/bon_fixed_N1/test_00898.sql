SELECT bid, COUNT(*) AS reservation_count
FROM Reserves
GROUP BY bid
HAVING COUNT(*) > 1;
