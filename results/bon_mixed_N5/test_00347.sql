SELECT r.Name
FROM region r
LEFT JOIN building b ON r.Region_ID = b.Region_ID
WHERE b.Building_ID IS NULL;
