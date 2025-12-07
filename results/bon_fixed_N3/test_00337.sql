SELECT r.Capital
FROM region r
JOIN building b ON r.Region_ID = b.Region_ID
GROUP BY r.Region_ID, r.Capital
ORDER BY COUNT(b.Building_ID) DESC
LIMIT 1;
