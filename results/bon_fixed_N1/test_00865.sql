SELECT sid
FROM Reserves r
JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('red', 'blue')
GROUP BY sid
HAVING COUNT(DISTINCT b.color) = 2;
