SELECT W.Location, COUNT(DISTINCT B.Contents) AS DistinctContentsCount
FROM Warehouses W
LEFT JOIN Boxes B ON W.Code = B.Warehouse
GROUP BY W.Location
ORDER BY W.Location;
