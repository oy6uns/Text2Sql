SELECT b.bid, COUNT(r.sid) AS reservation_count
FROM Boats b
LEFT JOIN Reserves r ON b.bid = r.bid AND r.sid > 1
GROUP BY b.bid;
