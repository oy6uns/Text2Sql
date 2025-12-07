SELECT W.Code AS Warehouse_Code, COUNT(DISTINCT B.Contents) AS Different_Content_Types
FROM Warehouses W
LEFT JOIN Boxes B ON W.Code = B.Warehouse
GROUP BY W.Code
ORDER BY W.Code;
