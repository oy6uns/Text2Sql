SELECT w.Code AS WarehouseCode, COUNT(DISTINCT b.Contents) AS DistinctContentsCount
FROM Warehouses w
LEFT JOIN Boxes b ON w.Code = b.Warehouse
GROUP BY w.Code;
