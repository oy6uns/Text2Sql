SELECT s.rating, AVG(s.age) AS average_age
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red'
GROUP BY s.rating;
