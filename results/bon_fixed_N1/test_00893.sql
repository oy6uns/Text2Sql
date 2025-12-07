SELECT Boats.name, COUNT(Reserves.bid) AS reservation_count
FROM Boats
LEFT JOIN Reserves ON Boats.bid = Reserves.bid
GROUP BY Boats.name;
