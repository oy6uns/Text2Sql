SELECT Boxes.Code
FROM Boxes
JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
WHERE Warehouses.Location = 'Chicago'
