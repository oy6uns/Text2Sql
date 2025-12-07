SELECT w.Code AS Warehouse_Code, COUNT(DISTINCT b.Contents) AS Distinct_Contents_Count
FROM Warehouses w
LEFT JOIN Boxes b ON w.Code = b.Warehouse
GROUP BY w.Code
ORDER BY w.Code;
