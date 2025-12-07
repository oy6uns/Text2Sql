SELECT b.name, COUNT(r.sid) AS reservation_count
FROM Boats b
JOIN Reserves r ON b.bid = r.bid
WHERE r.sid > 1
GROUP BY b.name;
