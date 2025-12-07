SELECT w.Code AS Warehouse_Code, COUNT(DISTINCT b.Contents) AS Distinct_Content_Types
FROM Warehouses w
LEFT JOIN Boxes b ON w.Code = b.Warehouse
GROUP BY w.Code;
