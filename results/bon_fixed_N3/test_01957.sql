SELECT g.Title
FROM game g
JOIN platform p ON g.Platform_ID = p.Platform_ID
WHERE p.Market_district IN ('Asia', 'USA')
