SELECT Boats.name, COUNT(*) AS reservation_count
FROM Reserves
JOIN Boats ON Reserves.bid = Boats.bid
GROUP BY Boats.name
HAVING COUNT(*) > 1;
