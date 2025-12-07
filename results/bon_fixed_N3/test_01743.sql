SELECT Warehouses.Code, COUNT(Boxes.Code) AS NumberOfBoxes
FROM Warehouses
LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse
GROUP BY Warehouses.Code;
