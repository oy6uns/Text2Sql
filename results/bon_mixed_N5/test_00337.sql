SELECT region.Capital
FROM region
JOIN (
  SELECT Region_ID, COUNT(*) AS building_count
  FROM building
  GROUP BY Region_ID
) b ON region.Region_ID = b.Region_ID
ORDER BY b.building_count DESC
LIMIT 1;
