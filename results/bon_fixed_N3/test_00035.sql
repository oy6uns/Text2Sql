SELECT DISTINCT p1.Country
FROM player p1
JOIN player p2 ON p1.Country = p2.Country
WHERE p1.Earnings > 1400000 AND p2.Earnings < 1100000;
