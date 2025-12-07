SELECT Boats.name, COUNT(Reserves.sid) AS reservation_count
FROM Boats
LEFT JOIN Reserves ON Boats.bid = Reserves.bid
GROUP BY Boats.name
ORDER BY Boats.name;
