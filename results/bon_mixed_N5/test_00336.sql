SELECT r.Name
FROM region r
JOIN building b ON r.Region_ID = b.Region_ID
GROUP BY r.Region_ID, r.Name
HAVING COUNT(b.Building_ID) > 1;
