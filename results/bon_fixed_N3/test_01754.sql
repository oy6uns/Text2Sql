SELECT Warehouses.Code AS Warehouse_Code, COUNT(DISTINCT Boxes.Contents) AS Different_Content_Types
FROM Warehouses
LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse
GROUP BY Warehouses.Code
ORDER BY Warehouses.Code;
