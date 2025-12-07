SELECT W.Code AS Warehouse_Code, COUNT(DISTINCT B.Contents) AS Different_Types_Of_Contents
FROM Warehouses W
LEFT JOIN Boxes B ON W.Code = B.Warehouse
GROUP BY W.Code
ORDER BY W.Code;
